# Maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Baptist BENOIST

pkgname=lddgraph-git
pkgver=r15.d42c718
pkgrel=1
pkgdesc="Small C++ code which creates dependencies graphs using ldd and Graphviz"
arch=(i686 x86_64)
url="http://www.github.com/bbenoist/lddgraph"
license=('BSD')
depends=('gcc-libs' 'graphviz' 'imagemagick')
makedepends=('git' 'make' 'cmake' 'gcc')
provides=(lddgraph)
conflicts=(lddgraph)
source=('git+https://github.com/bbenoist/lddgraph.git')
sha256sums=('SKIP')


pkgver() {
      cd "$srcdir/lddgraph"
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/lddgraph"
  rm -rf build
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr"
  make
}

package() {
  cd "$srcdir"/lddgraph/build
  make install
}
