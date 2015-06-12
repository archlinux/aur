# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=xwit
pkgver=3.4
pkgrel=3
pkgdesc="a utility that allows to call some X11 functions from CLI or shell script"
arch=('i686' 'armv6h' 'x86_64')
url="http://packages.debian.org/unstable/x11/xwit"
source=("http://ftp.de.debian.org/debian/pool/main/x/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz" "http://ftp.de.debian.org/debian/pool/main/x/${pkgname}/${pkgname}_${pkgver}-13.debian.tar.gz")
license=('other')
depends=('libx11')
md5sums=('bac527aab86715fcd76f44d9cf970ade'
         '4e90f8a687a7a9cf0180b5c35c13a2d0')

build() {
        cd ${srcdir}/${pkgname}-${pkgver}.orig
	for i in ../debian/patches/*patch;
		do
		patch -p1 < $i || return 1
		done
	gcc  -Wall -O2 -g -Wstrict-prototypes -Wmissing-prototypes -c -o xwit.o xwit.c
	gcc  -Wall -O2 -g -Wstrict-prototypes -Wmissing-prototypes -c -o ClientWin.o ClientWin.c
	gcc  -Wall -O2 -g -Wstrict-prototypes -Wmissing-prototypes -c -o dsimple.o dsimple.c
	gcc -Wall -O2 -g -Wstrict-prototypes -Wmissing-prototypes -Wl,-z,defs -lX11 -o xwit xwit.o ClientWin.o dsimple.o
}

package() {
        cd ${srcdir}/${pkgname}-${pkgver}.orig
	install -D -m644 xwit.man ${pkgdir}/usr/share/man/man1/xwit.1
	install -D -m755 xwit ${pkgdir}/usr/bin/xwit
}
