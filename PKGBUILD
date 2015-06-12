# Maintainer: jose1711 <jose1711 at gmail dot com>

pkgname=avinfo
pkgver=1.0a15
pkgrel=5
pkgdesc="a utility for displaying AVI, MPEG (1 and 2), OGM, MKV, and IFO (DVD) information"
arch=('i686' 'x86_64')
url="http://shounen.ru/soft/avinfo/"
license=('GPL')
makedepends=('bison')
source=("http://shounen.ru/soft/${pkgname}/${pkgname}-${pkgver}.zip")
md5sums=('dd4a92aa945f026dc4756ce38f4cf40e')

build() {
	cd ${srcdir}/src
        echo " 
1c1
< CFLAGS=-O9 -Wall --pedantic -foptimize-register-move -ffast-math -fschedule-insns2 -frerun-loop-opt -frerun-cse-after-loop -finline-functions -ffunction-cse -fmove-all-movables -freduce-all-givs -funroll-all-loops -fexpensive-optimizations -mcpu=pentiumpro -march=i386 
---
> CFLAGS=-O9 -Wall --pedantic -foptimize-register-move -ffast-math -fschedule-insns2 -frerun-loop-opt -frerun-cse-after-loop -finline-functions -ffunction-cse -funroll-all-loops -fexpensive-optimizations
EOF" | patch -p1 Makefile
	make || sed -i 's%int yyparse (void);%//&%' ass.tab.h
	make
}

package() {
	cd ${srcdir}/src
        install -D -c -s -m 755 avinfo ${pkgdir}/usr/bin/avinfo
}
