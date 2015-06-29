# Mainrainer: Michael Kogan <michael dot kogan at gmx dot net >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>

pkgname=lightspeed
pkgver=1.2a
pkgrel=4
pkgdesc='Illustrate the effects of special relativity on the appearance of moving objects.'
arch=('i686' 'x86_64')
license=('LGPL' 'MPL')
url='http://lightspeed.sourceforge.net'
depends=('gtkglarea1' 'libpng' 'libgl' 'libtiff')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz" "libpng.patch")
md5sums=('d6162f8b200db8ebfade791a71a439c0' '44e7e5d9de2a838ffc87b24e207e0507')

build() {
	patch $pkgname-$pkgver/src/snapshot.c < libpng.patch

	cd $pkgname-$pkgver

	./configure --prefix=/usr || return 1

	make || return 1
}
package(){
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install || return 1
}
