# Maintainer: kraylas <kraylas@outlook.com>

pkgname=ucmake-git
pkgver=0.6.4.r0.g868d8a2
pkgrel=1
pkgdesc="Ubpa CMake"
arch=('any')
url="https://github.com/Ubpa/UCMake"
license=('MIT')
depends=('cmake')
provides=('ucmake')
makedepends=('git' 'cmake')
source=(git+https://github.com/Ubpa/UCMake.git)
md5sums=('SKIP')

pkgver() {
	cd UCMake
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd UCMake
	cmake -DCMAKE_INSTALL_PREFIX="$srcdir/install" -S . -B _build
	cmake --build _build
}

package() {
	cd UCMake
	cmake --build _build --target install
	_dirname=`ls $srcdir/install`
	mkdir -p "${pkgdir}/usr/lib/cmake"
	mkdir -p "${pkgdir}/usr/share/licenses/ucmake-git"
	mv "$srcdir/install/$_dirname/cmake" "${pkgdir}/usr/lib/cmake/UCMake"
	mv "$srcdir/UCMake/LICENSE" "${pkgdir}/usr/share/licenses/ucmake-git"
}
