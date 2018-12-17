# Maintainer: Chris Lahaye <dev@chrislahaye.com>
pkgname=sdf3
pkgver=latest
pkgrel=1
pkgdesc='Tool for generating, analyzing, transforming, and visualizing random Synchronous DataFlow Graphs (SDFGs)'
url='http://www.es.ele.tue.nl/sdf3'
arch=('i386' 'x86_64')
license=('GPL')
depends=('boost-libs' 'libxml2')
makedepends=('chrpath' 'unzip')
source=('http://www.es.ele.tue.nl/sdf3/download/files/releases/sdf3.zip' 'Makefile.inc.patch')
md5sums=('77eadba886cf8c02b7c6831bd62cb675' '0607b3b91e382beeb452c0fbfee0e768')
noextract=('sdf3.zip')
options=('!makeflags')

prepare() {
	unzip sdf3.zip
	patch -p0 -i Makefile.inc.patch
}

build() {
	cd sdf3
	make
}

package() {
	cd sdf3/build/release/Linux

	mkdir -p $pkgdir/usr/bin $pkgdir/usr/lib
        install -Dm755 bin/* $pkgdir/usr/bin
	install -Dm755 lib/* $pkgdir/usr/lib

	find $pkgdir/usr/bin -type f -exec chrpath -d {} \+
}
