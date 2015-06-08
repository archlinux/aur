# Maintainer: Thomas Sefzick <t.sefzick@fz-juelich.de>
pkgname=beav
pkgver=1.40
pkgrel=1
pkgdesc="Binary Editor And Viewer (with some modifications by the Debian team: release 18)"
_debianpkgrel=18
url="http://packages.debian.org/stable/beav"
arch=('any')
depends=('ncurses')
license=('GPL')
source=(http://ftp.de.debian.org/debian/pool/main/b/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz http://ftp.de.debian.org/debian/pool/main/b/${pkgname}/${pkgname}_${pkgver}-${_debianpkgrel}.diff.gz beav_on_archlinux.patch)
md5sums=('9c30dce1697f468682eb2aae464de175'
         '63a2f7a63334abc020cd37e86d349ec1'
         '9402f42b2e54fa75dd398f213a7bb43a')


prepare() {
	_mypkgver=${pkgver/./}
	cd "$srcdir/beav-$_mypkgver"
	patch < "$srcdir/beav_${pkgver}-${_debianpkgrel}.diff"
	patch < "$srcdir/beav_on_archlinux.patch"
}

build() {
	_mypkgver=${pkgver/./}
	cd "$srcdir/beav-$_mypkgver"
	make
}

package() {
	_mypkgver=${pkgver/./}
	cd "$srcdir/beav-$_mypkgver"
	chmod 644 beav.1
	gzip -c beav${_mypkgver}.txt > beav${_mypkgver}.txt.gz
	chmod 644 beav${_mypkgver}.txt.gz
	chmod 755 beav
	mkdir -p $pkgdir/usr/share/man/man1
	cp -p beav.1 $pkgdir/usr/share/man/man1/.
	mkdir -p $pkgdir/usr/share/doc/beav
	cp -p beav${_mypkgver}.txt.gz $pkgdir/usr/share/doc/beav/.
	mkdir -p $pkgdir/usr/bin
	cp -p beav $pkgdir/usr/bin/.
}
