# Maintainer: blacktea <blackteahamburger@outlook.com>

pkgname=adios2
pkgver=2.6.0
pkgrel=1
pkgdesc="Next generation of ADIOS developed in the Exascale Computing Program"
license=('Apache')
arch=('x86_64')
url="https://adios2.readthedocs.io/en/latest/index.html"
depends=('libpng' 'zfp' 'hdf5' 'zeromq' 'libfabric' 'blosc' 'python' 'sz')
makedepends=('cmake')
source=("https://github.com/ornladios/ADIOS2/archive/v2.6.0.tar.gz")
sha256sums=('45b41889065f8b840725928db092848b8a8b8d1bfae1b92e72f8868d1c76216c')

prepare () {
  cd ADIOS2-$pkgver
}

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

