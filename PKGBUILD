# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=revbayes

pkgver=1.0.2
pkgrel=1
pkgdesc="bayesian phylogenetic inference using probabilistic graphical models and an interpreted language"
arch=(i686 x86_64)
url="https://github.com/revbayes/revbayes"
license=(GPL3)
depends=(gcc-libs)
makedepends=(boost cmake)
conflicts=('revbayes-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/revbayes/revbayes/archive/v$pkgver-release.tar.gz")
md5sums=('92339dda322e1dd2615f013960a91c4b')

prepare() {
  cd $srcdir/$pkgname-$pkgver-release

  rm -rf boost_*

  mkdir -p build

  cd projects/cmake
  ./regenerate.sh -boost false -mpi false
}

build() {
  cd $srcdir/$pkgname-$pkgver-release/build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ../projects/cmake

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver-release/build

  install -Dm755 rb $pkgdir/usr/bin/rb
}
