# Maintainer: Guilhem Saurel <saurel@laas.fr>

_pkgname=eigen
pkgname=${_pkgname}32
pkgver=3.2.10
pkgrel=1
pkgdesc="Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra. 3.2 branch."
arch=('any')
url='http://eigen.tuxfamily.org'
license=('GPL3' 'LGPL2.1' 'BSD' 'custom:MPL2' 'custom:MINPACK')
makedepends=('cmake' 'pkg-config' 'freeglut' 'gcc-fortran' 'fftw' 'qt4' 'suitesparse' 'boost')
optdepends=('qt4: for example programs')
replaces=('eigen3' 'eigen')
provides=('eigen3' 'eigen')
source=("${pkgname}-${pkgver}.tar.bz2::http://bitbucket.org/eigen/eigen/get/${pkgver}.tar.bz2")
sha1sums=('a85bb68c82988648c3d53ba9768d7dcbcfe105f8')

build() {
	mkdir -p build
	cd build
	cmake ../eigen-eigen-* \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
                -DCMAKE_INSTALL_LIBDIR=lib
}

package() {
	cd build
	make DESTDIR="$pkgdir" install

	# install custom licenses
	install -Dm644 ../eigen-eigen-*/COPYING.MPL2 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        install -Dm644 ../eigen-eigen-*/COPYING.BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        install -Dm644 ../eigen-eigen-*/COPYING.MINPACK "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
