# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=towave
pkgver=3
pkgrel=1
pkgdesc="Generates wave files from chiptunes"
arch=('i686' 'x86_64')
url="http://icesoldier.me/towave.html"
license=('GPL3')
depends=('libgme')
source=("http://icesoldier.me/filedump/$pkgname-rel$pkgver-src.tar.gz")
sha256sums=('88cbec348316d17b87e4854767dd40a4418beaaf4ff94370a66ff49ae07a6621')

prepare() {
	cd "$srcdir"
	sed -i -e 's,"gme/gme\.h",<gme/gme.h>,;s,\bgme_t\b,Music_Emu,g' towave.cpp
	echo 'towave: wave_writer.o -lgme' > Makefile
}

build() {
	cd "$srcdir"
	make
}

package() {
	cd "$srcdir"
	install -D towave "$pkgdir/usr/bin/towave"
}
