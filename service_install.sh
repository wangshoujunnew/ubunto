echo "[info] mysql 安装 root:root 查看3306端口是否已经含有, 如果有则已经安装"
if netstat -nl | grep 3306;then 
	echo "[mysql server 3306 has installed ... skip install]"
else
	sudo apt-get install mysql-server
	echo "[install over mysql-server]"
fi 

echo "[jdk install]"
sudo apt-get install openjdk-8-jdk


echo "[redis install ... todo ]"


echo "[tomcat install]"
if netstat -nl | grep 8080;then
	echo "[tomcat 服务已经存在]"
else
	wget https://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.5.54/bin/apache-tomcat-8.5.54.tar.gz
	tar -zxvf apache-tomcat-8.5.54.tar.gz 
	cd apache-tomcat-8.5.54/
	cur_dir=`pwd`
	echo "CATALINA_HOME=$cur_dir" >> bin/startup.sh
	echo "[启动tomcat]"
	sh bin/startup.sh
fi 
