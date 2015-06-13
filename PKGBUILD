# Maintainer: Michael F. schoenitzer <michael@schoenitzer.de>
pkgname=gpgkeymgr
pkgver=0.4
pkgrel=1
pkgdesc="a tool to clean up the GnuPG keyring"
arch=('i686' 'x86_64')
url="http://nudin.github.io/GnuPGP-Tools/"
license=('GPL3')
depends=(gpgme)
install=
source=(http://nudin.github.io/GnuPGP-Tools/gpgkeymgr/$pkgname-$pkgver.tar.gz)
md5sums=(cdefc0f36bd0c38905f1b55591207ebc)

build() {
        cd "$srcdir/$pkgname-$pkgver"
	make
}


package() {
	cd "$srcdir/$pkgname-$pkgver"
	sed "s|BINDIR.*=./usr/bin|BINDIR = $pkgdir/usr/bin|" Makefile > Makefile2
	sed "s|MAN.*=./usr/share/man|MAN = $pkgdir/usr/share/man|" Makefile2 > Makefile3
	sed "s|LOCAL.*=./usr/share/locale|LOCAL = $pkgdir/usr/share/locale|" Makefile3 > Makefile
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/man/man1/
	mkdir -p $pkgdir/usr/share/man/de/man1/
	mkdir -p $pkgdir/usr/share/locale
	echo $pkgdir
	make install
	make installtranslations
	make installmanpagetranslations
}
