pkgname=coin-or-qpoases
pkgver=3.1.0
pkgrel=1
pkgdesc="COIN-OR QP solver with online active set strategy"
arch=(i686 x86_64)
url="https://projects.coin-or.org/qpOASES/"
license=(LGPL2.1)
groups=(coin-or)
makedepends=(cmake)
depends=(blas lapack)
_name=qpOASES
source=("http://www.coin-or.org/download/source/${_name}/${_name}-$pkgver.tgz")
sha1sums=('7e14ec6f2c2c39814e985cdeaffe002dee92e47c')

build() {
  cd $srcdir/${_name}-$pkgver
  mkdir build && cd build

  cmake -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        "$srcdir/${_name}-$pkgver"

  make
}

check() {
  cd $srcdir/${_name}-$pkgver/build
  ./bin/example1
}

package() {
  cd $srcdir/${_name}-$pkgver/build
  make DESTDIR="$pkgdir" install
}
