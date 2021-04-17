# Maintainer: Kartik Mohta <kartikmohta@gmail.com>
pkgname=g2o
pkgver=20201223_git
pkgrel=1
pkgdesc="A General Framework for Graph Optimization"
arch=('i686' 'x86_64' 'armv7')
url="https://github.com/RainerKuemmerle/g2o"
license=('BSD')
groups=()
depends=('suitesparse' 'qt5-base' 'eigen3' 'glu')
optdepends=('libqglviewer: for building the g2o_viewer app')
makedepends=('git' 'cmake')
provides=('g2o')
conflicts=('g2o-svn' 'g2o-git')
options=()

source=($pkgname.tar.gz::https://github.com/RainerKuemmerle/g2o/archive/${pkgver}.tar.gz)
sha256sums=(20af80edf8fd237e29bd21859b8fc734e615680e8838824e8b3f120c5f4c1672)

#pkgver() {
#  cd "$pkgname"
#  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DG2O_BUILD_APPS=ON \
    -DG2O_BUILD_EXAMPLES=OFF
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
