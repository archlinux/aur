# Maintainer: Gary Hunt <garysERASE_THIS_PARTboxATgmailonedotcom>
# Contributor James G.
pkgname=tinyfugue-rebirth
pkgver=5.2.2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="flexible, screen-oriented MUD client, with python,lua,atcp,gmcp and option102 support"
url="http://https://github.com/ingwarsw/tinyfugue"
license=("GPL")
depends=(pcre zlib ncurses openssl lua51 python)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/ingwarsw/tinyfugue/archive/refs/tags/$pkgver.tar.gz"
	)

# build function
build() {
	cd $srcdir/tinyfugue-$pkgver
	CFLAGS="$CFLAGS $(INCLUDE)-D_GNU_SOURCE -Wno-error=return-mismatch -Wno-error=implicit-function-declaration -Wno-error=int-conversion -Wno-error=incompatible-pointer-types" ./configure --enable-atcp --enable-gmcp --enable-option102 --enable-python --enable-termcap=ncurses --enable-lua --bindir=/usr/bin/ --datarootdir=/usr/share 
	make
}

# package function, cleanup
package() {
	
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/doc/tinyfuge-rebirth
	mkdir -p $pkgdir/usr/share/tf-lib/
	cd $srcdir/tinyfugue-$pkgver
	cp src/tf $pkgdir/usr/bin/
	cd lib/
	cp tf/* $pkgdir/usr/share/tf-lib/
	cp lua/* $pkgdir/usr/share/tf-lib/
	cp py/* $pkgdir/usr/share/tf-lib/
}

sha256sums=('b7d0d914e6ae86f817bee341da77b74a62e22d601e7763e9bc86b074daa8892c')
