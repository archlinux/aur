# Maintainer: Michael F. schoenitzer <michael@schoenitzer.de>
pkgname=gpgkeymgr
pkgver=0.4
pkgrel=2
pkgdesc="a tool to clean up the GnuPG keyring"
arch=('i686' 'x86_64')
url="https://github.com/Nudin/gpgkeymgr"
license=('GPL3')
depends=(gpgme)
install=
source=(https://github.com/Nudin/gpgkeymgr/archive/refs/tags/v$pkgver.tar.gz)
md5sums=('4793767a92d4599c9398cd0f6799132d')

build() {
	cd "$srcdir/$pkgname-$pkgver/gpgkeymgr/"
	make
}


package() {
	cd "$srcdir/$pkgname-$pkgver/gpgkeymgr/"
	sed -i "s|BINDIR.*=./usr/bin|BINDIR = $pkgdir/usr/bin|" Makefile
	sed -i "s|MAN.*=./usr/share/man|MAN = $pkgdir/usr/share/man|" Makefile
	sed -i "s|LOCAL.*=./usr/share/locale|LOCAL = $pkgdir/usr/share/locale|" Makefile
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/man/man1/
	mkdir -p $pkgdir/usr/share/man/de/man1/
	mkdir -p $pkgdir/usr/share/locale
	echo $pkgdir
	make install
	make installtranslations
	make installmanpagetranslations
}
