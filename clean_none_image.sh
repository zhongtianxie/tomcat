#!/bin/bash
#由于平时一直使用Docker build 命令才生成一个镜像，有时候由于代码跟新频繁就会产生很多的none的image，最近想着清除一下。 
#于是就写了以下脚本：
docker ps -a | grep "Exited" | awk '{print $1 }'|xargs docker stop
docker ps -a | grep "Exited" | awk '{print $1 }'|xargs docker rm
docker images|grep none|awk '{print $3 }'|xargs docker rmi
