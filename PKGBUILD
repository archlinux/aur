# Maintainer: Bernardo Ferrari Mendonca <bernardo.mferrari@gmail.com>
pkgname=ophidian-units-git
pkgver=2.3
pkgrel=1
groups=('ophidian')
pkgdesc="A compile-time, header-only, dimensional analysis and unit conversion library built on c++14 with no dependencies."
arch=('any')
url="https://gitlab.com/eclufsc/units"
license=('MIT')
makedepends=('cmake' 'make')
source=('git+https://gitlab.com/eclufsc/units.git#branch=master')
md5sums=('SKIP')


build() {
	cd $srcdir/units
    mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

check() {
    cd $srcdir/units/build/unitTests
    ./unitLibTest
}

package() {
    install -d $pkgdir/usr/share/units
    install -D -m 644 $srcdir/units/LICENSE $pkgdir/usr/share/units/copyright

	cd $srcdir/units/build
	make DESTDIR="$pkgdir/" install
}
