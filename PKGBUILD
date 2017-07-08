# Maintainer: orumin <dev at orum.in>

pkgname=eigen-multilib
pkgver=3.3.4
pkgrel=1
pkgdesc="Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra. (multilib version)"
arch=('any')
url='http://eigen.tuxfamily.org'
license=('GPL3' 'LGPL2.1' 'BSD' 'custom:MPL2' 'custom:MINPACK')
makedepends=('cmake' 'pkg-config' 'freeglut' 'lib32-freeglut' 'gcc-fortran' 'fftw' 'lib32-fftw' 'qt4' 'lib32-fftw' 'suitesparse' 'lib32-suitesparse' 'boost' 'lib32-boost-libs')
optdepends=('qt4: for example programs')
conflicts=('eigen')
replaces=('eigen')
provides=('eigen')
source=("${pkgname}-${pkgver}.tar.bz2::http://bitbucket.org/eigen/eigen/get/${pkgver}.tar.bz2")
sha1sums=('e52d7d7a8c81f5ee0699e63ae3b78fe8214380a5')

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
