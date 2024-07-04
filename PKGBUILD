# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Lorenz Steinert <lorenz@steinerts.de>

pkgname=h5cpp
pkgver=0.6.0
pkgrel=1
pkgdesc="h5cpp is a C++ wrapper for HDF5s C-API."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="h5cpp.org"
license=('GPL2')
depends=('boost-libs' 'hdf5')
optdepends=()
makedepends=('cmake' 'boost')
checkdepends=('catch2')
source=("https://github.com/ess-dmsc/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('72b459c92670628d730b3386fe6f4ac61218885afa904f234a181c2022a9f56f')

build() {
    cd $srcdir/$pkgname-$pkgver

    mkdir -p build
    cd build

    cmake \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DH5CPP_CONAN=DISABLE \
      ..

    make
}

package() {
    cd $srcdir/$pkgname-$pkgver/build
    make DESTDIR="$pkgdir" install
}

check() {
    cd $srcdir/$pkgname-$pkgver/build
    ctest
}

# Local Variables:
# tab-width: 4
# End:
