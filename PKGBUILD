# Maintainer: Tiago de Paula Peixoto <tiago@skewed.de>

# Remove the --enable-openmp flag below if you do not want parallelization.

pkgname=python-graph-tool
pkgver=2.13
pkgrel=1
pkgdesc='A Python module for manipulation and statistical analysis of graphs'
arch=('i686' 'x86_64')
url='http://projects.skewed.de/graph-tool/'
license=(GPL3)
depends=(boost python3 expat python3-scipy python3-numpy cgal)
makedepends=(sparsehash python-cairo autoconf-archive)
optdepends=('graphviz: graph layout'
'cairomm: graph drawing'
'python-cairo: graph drawing'
'python-matplotlib: graph drawing')
provides=(python3-graph-tool)
conflicts=(python3-graph-tool)
replaces=(python3-graph-tool)
options=(!libtool)
source=("http://downloads.skewed.de/graph-tool/graph-tool-$pkgver.tar.bz2")
sha256sums=('8a4ab48518cbdec41b2e2a8151eb563fe837361d84d77896fa7b24dc64c81e8b')

prepare() {
  cd "$srcdir/graph-tool-$pkgver"
  aclocal
  autoconf
  ./configure --enable-openmp --prefix=/usr --docdir="/usr/share/doc/$pkgname"
}

build() {
  cd "$srcdir/graph-tool-$pkgver"
  make
}

check() {
  cd "$srcdir/graph-tool-$pkgver"
  make check
}

package() {
  cd "$srcdir/graph-tool-$pkgver"
  make DESTDIR="$pkgdir/" install
}
