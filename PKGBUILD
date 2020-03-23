# Maintainer: Tiago de Paula Peixoto <tiago@skewed.de>

# Remove the --enable-openmp flag below if you do not want parallelization.

pkgname=python2-graph-tool
pkgver=2.30
pkgrel=1
pkgdesc='A Python module for manipulation and statistical analysis of graphs'
arch=('i686' 'x86_64')
url='https://graph-tool.skewed.de'
license=(GPL3)
depends=(boost-libs python2 expat python2-scipy python2-numpy cgal cairomm python2-cairo)
makedepends=(boost sparsehash)
optdepends=('graphviz: graph layout'
'python2-matplotlib: graph drawing')
options=(!libtool)
source=("https://downloads.skewed.de/graph-tool/graph-tool-$pkgver.tar.bz2")
sha256sums=('823cf3374b08fbfe8f580d08ae063913d021ff92f8ef1365d317e8ea38ecc8bf')

prepare() {
  cd "$srcdir/graph-tool-$pkgver"
  ./configure --enable-openmp --prefix=/usr --docdir="/usr/share/doc/$pkgname" PYTHON=python2
}

build() {
  cd "$srcdir/graph-tool-$pkgver"
  make -j 1  # most users will be surprised with the high memory usage required for parallel builds
 }

check() {
  cd "$srcdir/graph-tool-$pkgver"
  make check
}

package() {
  cd "$srcdir/graph-tool-$pkgver"
  make DESTDIR="$pkgdir/" install
}
