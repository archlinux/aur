# Maintainer: Lorenz Steinert <lorenz@steinerts.de>

pkgname=h5cpp
_pkgname=myMPD
pkgver=0.3.3
pkgrel=1
pkgdesc="h5cpp is a C++ wrapper for HDF5s C-API."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="h5cpp.org"
license=('GPL2')
optdepends=()
makedepends=('cmake' 'hdf5')
source=("https://github.com/ess-dmsc/$pkgname/archive/v$pkgver.tar.gz"
        "newer_hdf5_lib.patch")
sha256sums=('2ccae670109d605a2c26729abd2b1a98b0b5a7fe5dd98df5f03c5fe76463e1e7'
            'b84f7016e5a3363e4653abb9e975659a99daf41f0814123106f83154182e516b')

build() {
    cd $srcdir/$pkgname-$pkgver

    patch -f -p0 -i $srcdir/newer_hdf5_lib.patch

    mkdir -p build
    cd build
    cmake -DCONAN=DISABLE -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver/build
    make DESTDIR="$pkgdir"  install
}
