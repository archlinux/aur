# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='dimemas'
pkgdesc='High-abstracted network simulator for message-passing programs (from BSC).'
pkgver='5.4.0'
pkgrel='1'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPLv2.1')
depends=(boost)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha512sums=(4625cd82d10d1affec8da346400176e2bc2560d4a2b7ff803e1694524a2874c699b43c1c28cf7227c058449c8931b95e0315ff9f7a46d8358236ace8d93ba8f5)

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	# See https://github.com/brianb/mdbtools/issues/47
	sed -i 's/LIBS="$LIBS $LEXLIB"//g' configure.ac
	sed -i '1s/^/%option noyywrap\n/' Simulator/input/lex.l
	autoreconf -i -f
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure \
		--prefix=/usr

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install
}