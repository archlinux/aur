# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=revbayes

pkgver=1.0.0
_pkgver=1.0.0-beta.0
pkgrel=1
pkgdesc="bayesian phylogenetic inference using probabilistic graphical models and an interpreted language"
arch=(i686 x86_64)
url="https://github.com/revbayes/revbayes"
license=(GPL3)
depends=(gcc-libs)
makedepends=(boost cmake)
conflicts=('revbayes-git')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/revbayes/revbayes/archive/v$_pkgver.tar.gz")
md5sums=('0f87b60216538c06cbb3bfcd6001d419')

prepare() {
  cd $srcdir/$pkgname-$_pkgver

  rm -rf boost_1_55_0

  mkdir -p build

  cd projects/cmake
  ./regenerate.sh -boost false -mpi false
}

build() {
  cd $srcdir/$pkgname-$_pkgver/build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ../projects/cmake

  make
}

package() {
  cd $srcdir/$pkgname-$_pkgver/build

  install -Dm755 rb $pkgdir/usr/bin/rb
}
