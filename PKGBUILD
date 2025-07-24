pkgname=sundials-seq
_pkgname=sundials
pkgver=7.4.0
pkgrel=1
pkgdesc='Suite of nonlinear differential/algebraic equation solvers (sequential version)'
arch=(x86_64)
url='https://computing.llnl.gov/projects/sundials'
license=(BSD)
depends=(suitesparse)
makedepends=(cmake gcc-fortran python)
source=(https://github.com/LLNL/sundials/archive/v$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=('3f84277b73922507beae83439b6a234d855fd53ba1f61728111968dea5fac29b')
provides=(sundials)
conflicts=(sundials)

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_STATIC_LIBS=OFF \
    -DENABLE_MPI=OFF \
    -DENABLE_PTHREAD=ON	\
    -DENABLE_OPENMP=ON \
    -DENABLE_KLU=ON \
    -DKLU_LIBRARY_DIR=/usr/lib \
    -DKLU_INCLUDE_DIR=/usr/include/suitesparse \
    -DEXAMPLES_ENABLE_C=OFF \
    -DEXAMPLES_INSTALL_PATH=/usr/share/sundials/examples
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $_pkgname-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$_pkgname
}
