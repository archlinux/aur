pkgname=tasmanian
pkgver=7.7
pkgrel=1
pkgdesc="Toolkit for Adaptive Stochastic Modeling and Non-Intrusive ApproximatioN"
license=('BSD')
arch=('x86_64')
url="https://tasmanian.ornl.gov/"
depends=('lapack')
makedepends=('cmake')
source=("https://github.com/ORNL/TASMANIAN/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('85fb3a7b302ea21a3b700712767a59a623d9ab93da03308fa47d4413654c3878')

build() {
  cd TASMANIAN-$pkgver
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DTasmanian_ENABLE_OPENMP=ON \
        -DTasmanian_ENABLE_BLAS=ON \
        ..
  make
}

package() {
  cd TASMANIAN-$pkgver/build
  make DESTDIR="$pkgdir" install
}

