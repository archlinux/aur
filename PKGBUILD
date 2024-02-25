pkgname=lapack-static
pkgver=3.12.0
pkgrel=1
url='https://www.netlib.org/lapack'
pkgdesc='Linear Algebra PACKage'
makedepends=(gcc-fortran cmake)
arch=(x86_64)
license=(custom)
source=(https://github.com/Reference-LAPACK/lapack/archive/v$pkgver/lapack-$pkgver.tar.gz)
sha256sums=('eac9570f8e0ad6f30ce4b963f4f033f0f643e7c3912fc9ee6cd99120675ad48b')

build() {
  cmake -B build -S lapack-$pkgver \
    -DBUILD_SHARED_LIBS=OFF -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_Fortran_COMPILER=gfortran \
    -DCBLAS=ON \
    -DBUILD_DEPRECATED=ON \
    -DTEST_FORTRAN_COMPILER=OFF
  cmake --build build
}

package() {
  install -d "$pkgdir"/usr/lib/
  install -m644 build/lib/lib*.a "$pkgdir"/usr/lib/
}

