# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=fluff
pkgver=1.0.3
_pkgver=1_0_3
pkgrel=1
pkgdesc="Fast, light file manager application for FLTK"
arch=('i686' 'x86_64')
url="https://sites.google.com/site/lockmoorecoding/downloads/fluff"
license=('GPL')
depends=('fltk')
makedepends=('gendesk')
source=(https://sites.google.com/site/lockmoorecoding/downloads/$pkgname/${pkgname}_${_pkgver}_src.tar.gz)
md5sums=('94c4a97d31e1fe850d765a70762e0c52')

prepare() {
	cd "$srcdir"
	sed -i 's|include <Fl/|include <FL/|
		s|/usr/local/|/usr/|' fluff.cpp
	sed -i 's/gcc `fltk-config --use-images --ldflags` -lfltk_images -lm ${PROG}.o -o ${PROG}/g++ ${PROG}.o `fltk-config --use-images --ldflags` -lfltk_images -lm -o ${PROG}/' Makefile
	gendesk -n -f --pkgname=$pkgname --pkgdesc="Fast, light file manager" --categories="System;FileManager"
}

build() {
	cd "$srcdir"
	make
}

package() {
	cd "$srcdir"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm755 ${pkgname}_fc.sh "$pkgdir/usr/bin/${pkgname}_fc.sh"
	install -Dm644 ${pkgname}_help.htm "$pkgdir/usr/share/doc/fluff/${pkgname}_help.htm"
	install -Dm644 $pkgname.gif "$pkgdir/usr/share/doc/fluff/$pkgname.gif"
	install -Dm644 $pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
