pkgname=adios2
pkgver=2.5.0
pkgrel=1
pkgdesc="Next generation of ADIOS developed in the Exascale Computing Program"
license=('Apache')
arch=('x86_64')
url="https://adios2.readthedocs.io/en/latest/index.html"
depends=('libpng' 'zfp' 'hdf5' 'zeromq' 'libfabric' 'blosc' 'python' 'sz')
makedepends=('cmake')
source=("https://github.com/ornladios/ADIOS2/archive/v$pkgver.tar.gz")
sha256sums=('7c8ff3bf5441dd662806df9650c56a669359cb0185ea232ecb3578de7b065329')

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

