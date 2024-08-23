# Maintainer: David Wells <drwells.aur at fastmail dot com>

pkgname=nanoflann
pkgver=1.6.0
pkgrel=1
pkgdesc='a C++ header-only library for Nearest Neighbor (NN) search wih KD-trees'
arch=('any')
url='https://github.com/jlblancoc/nanoflann'
license=('BSD')
depends=('eigen' 'python')
makedepends=('cmake' 'gtest')
source=("https://github.com/jlblancoc/nanoflann/archive/v${pkgver}.tar.gz")
sha256sums=('f889026fbcb241e1e9d71bab5dfb9cc35775bf18a6466a283e2cbcd60edb2705')

build() {
    rm -rf ${srcdir}/build
    mkdir ${srcdir}/build
    cd ${srcdir}/build

    cmake -DCMAKE_INSTALL_PREFIX="/usr/" ../$pkgname-$pkgver
    make ${MAKEFLAGS}
}

check() {
    cd $srcdir/build
    make test
}

package() {
  cd $srcdir/build
  make DESTDIR="$pkgdir" install

  install -Dm644 $srcdir/$pkgname-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
