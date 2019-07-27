pkgname=adios2
pkgver=2.4.0
pkgrel=1
pkgdesc="Next generation of ADIOS developed in the Exascale Computing Program"
license=('Apache')
arch=('x86_64')
url="https://adios2.readthedocs.io/en/latest/index.html"
depends=('libpng' 'zfp' 'hdf5' 'zeromq' 'libfabric' 'blosc' 'python')
makedepends=('cmake')
source=("https://github.com/ornladios/ADIOS2/archive/v$pkgver.tar.gz")
sha256sums=('50ecea04b1e41c88835b4b3fd4e7bf0a0a2a3129855c9cc4ba6cf6a1575106e2')

build() {
  cd ADIOS2-$pkgver
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DADIOS2_BUILD_TESTING=OFF \
        -DADIOS2_BUILD_EXAMPLES=OFF \
        ..
  make
}

package() {
  cd ADIOS2-$pkgver/build
  make DESTDIR="$pkgdir" install
}

