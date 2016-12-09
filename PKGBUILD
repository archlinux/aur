# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=revbayes-mpi

pkgver=1.0.2
pkgrel=1
pkgdesc="bayesian phylogenetic inference using probabilistic graphical models and an interpreted language"
arch=(i686 x86_64)
url="https://github.com/revbayes/revbayes"
license=(GPL3)
depends=(openmpi)
makedepends=(boost cmake)
conflicts=('revbayes-mpi-git')
source=("revbayes-$pkgver.tar.gz::https://github.com/revbayes/revbayes/archive/v$pkgver-release.tar.gz")
md5sums=('92339dda322e1dd2615f013960a91c4b')

prepare() {
  cd $srcdir/revbayes-$pkgver-release

  rm -rf boost_*

  mkdir -p build

  cd projects/cmake
  ./regenerate.sh -boost false -mpi true
}

build() {
  cd $srcdir/revbayes-$pkgver-release/build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ../projects/cmake

  make
}

package() {
  cd $srcdir/revbayes-$pkgver-release/build

  install -Dm755 rb-mpi $pkgdir/usr/bin/rb-mpi
}
