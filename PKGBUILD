# Maintainer: Dominik Heidler <dominik@heidler.eu>

pkgname=libsml-git
pkgver=0.1.1.r58.ga83ec40
pkgrel=2
pkgdesc="Implementation in C of the Smart Message Language (SML) protocol"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
depends=('libutil-linux')
optdepends=()
provides=('libsml')
conflicts=('libsml')
url="https://github.com/volkszaehler/libsml"
source=('git://github.com/volkszaehler/libsml.git')
md5sums=('SKIP')

_gitname=libsml

pkgver() {
	cd $srcdir/$_gitname
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $srcdir/$_gitname
	make
}

package() {
	cd $srcdir/$_gitname
	mkdir -p $pkgdir/usr/lib/
	cp -v sml/lib/libsml.so.1 $pkgdir/usr/lib/
	ln -s libsml.so.1 $pkgdir/usr/lib/libsml.so
	mkdir -p $pkgdir/usr/include/
	cp -vR sml/include/sml $pkgdir/usr/include/
	mkdir -p $pkgdir/usr/lib/pkgconfig/
	cp -v sml.pc $pkgdir/usr/lib/pkgconfig/
}
