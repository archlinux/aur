pkgname=lapack-static
pkgver=3.11.0
pkgrel=1
url='https://www.netlib.org/lapack'
pkgdesc='Linear Algebra PACKage'
makedepends=(gcc-fortran cmake)
arch=(x86_64)
license=(custom)
source=(https://github.com/Reference-LAPACK/lapack/archive/v$pkgver/lapack-$pkgver.tar.gz)
sha256sums=('4b9ba79bfd4921ca820e83979db76ab3363155709444a787979e81c22285ffa9')

build() {
  cmake -B build -S lapack-$pkgver \
    -DBUILD_SHARED_LIBS=OFF \
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

