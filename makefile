# created by haoxq 2012.01.13
# 添加公共的头文件还存在问题

.PHONY: all clean

#CC=/usr/local/ti-sdk-am335x-evm/linux-devkit/bin/arm-arago-linux-gnueabi-gcc
CC = arm-arago-linux-gnueabi-gcc
#CC = arm-linux-gnueabihf-gcc
RM = rm
CP = cp

# 针对不同文件夹需要变更的地方
TARGETS = stv6111_test   #目标文件名称

# 可执行文件存放目录
BIN_DIR = ./

#公共文件库存放目录
#COMMON_DIR  = ../common
#COMMON_NAME = common.a

#编译条件, debug和release
#CFLAGS   = -O0 -g3 -Wall -c -fmessage-length=0   #debug 
CFLAGS = -O3 -Wall -c -fmessage-length=0        #release

LIBS += -lpthread 
LIBS += -lm

# 以下内容不需要修改
SRCS = $(wildcard *.c) 
OBJS = $(patsubst %.c, %.o, $(SRCS))

#$(TARGETS): $(OBJS) $(COMMON_DIR)/$(COMMON_NAME)
$(TARGETS): $(OBJS) 
	$(CC) -o $@  $^ $(LIBS)
	#$(CP) $(TARGETS) $(BIN_DIR)
%.o: %.c
	$(CC) -o $@ $(CFLAGS) $^ $(LIBS)

clean:
	$(RM) -fr $(TARGETS) $(OBJS)
