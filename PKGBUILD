# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=revbayes

pkgver=1.0.4
pkgrel=1
pkgdesc="bayesian phylogenetic inference using probabilistic graphical models and an interpreted language"
arch=(i686 x86_64)
url="https://github.com/revbayes/revbayes"
license=(GPL3)
depends=(gcc-libs)
makedepends=(boost cmake)
conflicts=('revbayes-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/revbayes/revbayes/archive/v$pkgver-release.tar.gz")

prepare() {
  cd $srcdir/$pkgname-$pkgver-release

  rm -rf boost_*

  cd projects/cmake

  mkdir -p build

  ./regenerate.sh -boost false -mpi false
}

build() {
  cd $srcdir/$pkgname-$pkgver-release/projects/cmake/build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver-release/projects/cmake

  install -Dm755 rb $pkgdir/usr/bin/rb
}

md5sums=('5d6de96bcb3b2686b270856de3555a58')
