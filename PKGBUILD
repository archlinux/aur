pkgname=superlu_mt
pkgver=4.0.2
pkgrel=1
pkgdesc="Set of subroutines to solve a sparse linear system (multithreading extension)"
arch=('x86_64')
url="https://github.com/xiaoyeli/superlu_mt"
license=(BSD-3-Clause)
depends=(libgcc libgomp glibc blas)
makedepends=(gcc-fortran cmake)
options=('staticlibs')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bc6659b145347fa77f90902827c140204c779f297ecb0dddb02a9d71dd2963a9')

build() {
  cd "$srcdir/superlu_mt-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBLA_VENDOR=Generic -DBUILD_SHARED_LIBS=ON \
    -Denable_examples=OFF -Denable_tests=OFF -DPLAT="_OPENMP" .
  make
}

package() {
  cd "$srcdir/superlu_mt-${pkgver}"
  make install DESTDIR="${pkgdir}"
  
  install -Dm644 License.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
