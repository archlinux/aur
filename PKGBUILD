# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
pkgname=z88dk-splib2
pkgver=1.10.1
pkgrel=1
pkgdesc="A small C compiler for the Zilog Z80 with splib2 grafics library."
arch=('i686' 'x86_64')
url="http://z88dk.org"
license=('custom:The Clarified Artistic License')
groups=()
depends=('glibc')
source=(https://dl.dropboxusercontent.com/u/58286032/aur/$pkgname-$pkgver.tar.gz)
md5sums=('397ffbd6779bc514bdd3f3e6ed8e3086') 

build() {
	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p $pkgdir/usr/share/licenses/z88dk/
	cp LICENSE $pkgdir/usr/share/licenses/z88dk

	make || return 1
	make prefix=/usr DESTDIR="${pkgdir}" install || return 1

	mkdir -p $pkgdir/etc/profile.d
	echo "export ZCCCFG=/usr/share/z88dk/lib/config/" > $pkgdir/etc/profile.d/z88dk.sh
	echo "export Z80_OZFILES=/usr/share/z88dk/lib/" >>  $pkgdir/etc/profile.d/z88dk.sh
	chmod +x  $pkgdir/etc/profile.d/z88dk.sh
}