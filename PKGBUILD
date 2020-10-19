# Maintainer: Guilhem Saurel <saurel@laas.fr>

_pkgname=eigen
pkgname=${_pkgname}32
pkgver=3.2.10
pkgrel=3
pkgdesc="Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra. 3.2 branch."
arch=('any')
url='http://eigen.tuxfamily.org'
license=('GPL3' 'LGPL2.1' 'BSD' 'custom:MPL2' 'custom:MINPACK')
makedepends=('cmake' 'freeglut' 'gcc-fortran' 'fftw' 'qt4' 'suitesparse' 'boost')
optdepends=('qt4: for example programs')
conflicts=('eigen3' 'eigen')
provides=('eigen3' 'eigen')
source=("${pkgname}-${pkgver}.tar.bz2::https://gitlab.com/libeigen/eigen/-/archive/${pkgver}/eigen-${pkgver}.tar.bz2")
sha1sums=('ff8e208ec59fab48173d8e2569bbec116fca1aca')

build() {
	mkdir -p build
	cd build
	cmake ../eigen-* \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
                -DCMAKE_INSTALL_LIBDIR=lib
}

package() {
	cd build
	make DESTDIR="$pkgdir" install

	# install custom licenses
	install -Dm644 ../eigen-*/COPYING.MPL2 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        install -Dm644 ../eigen-*/COPYING.BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        install -Dm644 ../eigen-*/COPYING.MINPACK "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
