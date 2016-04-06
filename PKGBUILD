# Maintainer: Stefan Schmidt <thrimbor dot github at gmail dot com>

pkgname=yarp
pkgver=2.3.64
pkgrel=2
pkgdesc='Yet Another Robot Platform'
arch=('x86_64' 'i686')
url="http://www.yarp.it"
license=('LGPL')
depends=('cmake' 'subversion' 'wget' 'qt5-base' 'qt5-declarative' 'qt5-multimedia' 'qt5-svg' 'goocanvasmm' 'tinyxml' 'gtkmm' 'ace' 'gsl')
makedepends=('cmake')
sha256sums=('3882b38c39ec9c5fdd06c68f3a4ad21da718bd2733ed7d6a5fb78d9f36dad6b2'
			'88c5be5a1dbef2d8dcf9a9540fc697b64040167c72e0522233c591bd238f6ab0')
source=("https://github.com/robotology/yarp/archive/v${pkgver}.tar.gz"
		'yarp-gui-cxx11.patch')

prepare() {
	cd "$srcdir"
	patch -p0 -i "$srcdir/yarp-gui-cxx11.patch"
}

build() {
	mkdir -p "$srcdir/yarp-$pkgver/build"
	cd "$srcdir/yarp-$pkgver/build"
	cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCREATE_GUIS=ON -DCREATE_LIB_MATH=ON
	make
}

package() {
	cd "$srcdir/yarp-$pkgver/build"
	mv lib64 lib
	make DESTDIR="${pkgdir}" install
}
