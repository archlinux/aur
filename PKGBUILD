# Maintainer: Kartik Mohta <kartikmohta@gmail.com>
pkgname=g2o-git
pkgver=r692.0fb5b33
pkgrel=1
pkgdesc="A General Framework for Graph Optimization"
arch=('i686' 'x86_64')
url="https://github.com/RainerKuemmerle/g2o"
license=('BSD')
groups=()
depends=('suitesparse' 'qt4' 'eigen3' 'glu')
makedepends=('git' 'cmake')
provides=('g2o')
conflicts=('g2o-svn')
options=()
source=($pkgname::git+https://github.com/RainerKuemmerle/g2o.git)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_SKIP_RPATH=ON -DG2O_BUILD_APPS=OFF \
    -DG2O_BUILD_EXAMPLES=OFF
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir" install
}
