# Maintainer: David Wells <drwells.aur at fastmail dot com>

pkgname=nanoflann
pkgver=1.5.0
pkgrel=1
pkgdesc='a C++ header-only library for Nearest Neighbor (NN) search wih KD-trees'
arch=('any')
url='https://github.com/jlblancoc/nanoflann'
license=('BSD')
depends=('eigen' 'python')
makedepends=('cmake' 'gtest')
source=("https://github.com/jlblancoc/nanoflann/archive/v${pkgver}.tar.gz")
sha256sums=('89aecfef1a956ccba7e40f24561846d064f309bc547cc184af7f4426e42f8e65')

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
