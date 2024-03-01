import 'package:flutter/material.dart';

class Messager extends StatefulWidget {
  final List messages;
  const Messager({Key? key, required this.messages}) : super(key: key);

  @override
  _MessagerState createState() => _MessagerState();
}

class _MessagerState extends State<Messager> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment:
                      widget.messages[index]['isUserMessage'] ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: const Radius.circular(20),
                          topRight: const Radius.circular(20),
                          bottomRight: Radius.circular(widget.messages[index]['isUserMessage'] ? 0 : 20),
                          topLeft: Radius.circular(widget.messages[index]['isUserMessage'] ? 20 : 0),
                        ),
                        color: widget.messages[index]['isUserMessage']
                            ? Colors.grey.shade800
                            : Colors.grey.shade900.withOpacity(0.8),
                      ),
                      constraints: BoxConstraints(maxWidth: w * 2 / 3),
                      child: Text(widget.messages[index]['message'].text.text[0]),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (_, i) => const Padding(padding: EdgeInsets.only(top: 10)),
            itemCount: widget.messages.length,
          ),
        ],
      ),
    );
  }
}
