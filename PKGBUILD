# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Lorenz Steinert <lorenz@steinerts.de>

pkgname=h5cpp
pkgver=0.5.1
pkgrel=1
pkgdesc="h5cpp is a C++ wrapper for HDF5s C-API."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="h5cpp.org"
license=('GPL2')
depends=('boost-libs' 'hdf5')
optdepends=()
makedepends=('cmake' 'boost')
source=("https://github.com/ess-dmsc/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('8fcab57ffbc2d799fe315875cd8fcf67e8b059cccc441ea45a001c03f6a9fd25')

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
    make DESTDIR="$pkgdir"  install
}
