pkgname=lapack-static
pkgver=3.10.1
pkgrel=1
url='https://www.netlib.org/lapack'
pkgdesc='Linear Algebra PACKage'
makedepends=(gcc-fortran cmake)
arch=(x86_64)
license=(custom)
source=(https://github.com/Reference-LAPACK/lapack/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('cd005cd021f144d7d5f7f33c943942db9f03a28d110d6a3b80d718a295f7f714')

build() {
  cmake -B build -S lapack-$pkgver \
    -DBUILD_SHARED_LIBS=OFF \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_Fortran_COMPILER=gfortran \
    -DCBLAS=ON \
    -DBUILD_DEPRECATED=ON
  cmake --build build
}

package() {
  install -d "$pkgdir"/usr/lib/
  install -m644 build/lib/lib*.a "$pkgdir"/usr/lib/
}

