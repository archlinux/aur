# Maintainer: Tiago de Paula Peixoto <tiago@skewed.de>

# Remove the --enable-openmp flag below if you do not want parallelization.

pkgname=python-graph-tool
pkgver=2.30
pkgrel=1
pkgdesc='A Python module for manipulation and statistical analysis of graphs'
arch=('i686' 'x86_64')
url='https://graph-tool.skewed.de'
license=(GPL3)
depends=(boost-libs python3 expat python3-scipy python-numpy cgal cairomm python-cairo)
makedepends=(boost sparsehash cairomm python-cairo autoconf-archive)
optdepends=('graphviz: graph layout'
'python-matplotlib: graph drawing')
provides=(python3-graph-tool)
conflicts=(python3-graph-tool)
replaces=(python3-graph-tool)
options=(!libtool)
source=("https://downloads.skewed.de/graph-tool/graph-tool-$pkgver.tar.bz2")
sha256sums=('823cf3374b08fbfe8f580d08ae063913d021ff92f8ef1365d317e8ea38ecc8bf')
prepare() {
  cd "$srcdir/graph-tool-$pkgver"
  ./configure --enable-openmp --prefix=/usr --docdir="/usr/share/doc/$pkgname"
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
