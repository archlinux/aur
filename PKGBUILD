# Original Package: Dario Pellegrini <pellegrini.dario@gmail.com>
# Maintainer: Dario Pellegrini <pellegrini.dario@gmail.com>

pkgname=lib-fast-winding-number
pkgver=20181123
pkgrel=1
pkgdesc='Code for fast approximate generalized winding number (solid angle) computation for triangle soups'
arch=('any')
license=('MIT')
makedepends=('git' 'cmake')
depends=('intel-tbb')
# Using the pymesh fork instead of the original from sideeffects, as it includes cmake scripts
url='https://github.com/PyMesh/WindingNumber/'
provides=(lib-fast-winding-number)
conflicts=()

source=('git+https://github.com/PyMesh/WindingNumber.git')
md5sums=('SKIP')

_gitname='WindingNumber'

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
  #git describe --always --tags | sed 's/-/./g'
}

build() {
  mkdir -p "$_gitname/build"
  cd "$_gitname/build"

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make
  make tests
}

package() {
  cd "$_gitname/build"
  make DESTDIR="$pkgdir/" install
}
