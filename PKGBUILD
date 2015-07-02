# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thomas Laroche <tho.laroche@gmail.com>
pkgname=libpedsim
pkgver=2.3
pkgrel=2
pkgdesc="A Microscopic Pedestrian Crowd Simulation System"
arch=('i686' 'x86_64')
url="http://pedsim.silmaril.org/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake>=2.8')
source=("http://pedsim.silmaril.org/dist/libpedsim/20140211-$pkgname-2-3-src.tar.gz"
		 libpedsim.CMakeLists)
md5sums=('6c33004b0a3c7e5270347f9515ba33a3'
         '264590a8e55e2f7e10885cf33935b740')

prepare() {
	cd "$srcdir/$pkgname"
	cp "$srcdir/libpedsim.CMakeLists" CMakeLists.txt
	sed -i "s/ped_includes.h/pedsim.h/" examples/example.cpp
}

build() {
	cd "$srcdir/$pkgname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
