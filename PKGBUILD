# Maintainer: Tiago de Paula Peixoto <tiago@skewed.de>

# Remove the --enable-openmp flag below if you do not want parallelization.

pkgname=python-graph-tool
pkgver=2.19
pkgrel=1
pkgdesc='A Python module for manipulation and statistical analysis of graphs'
arch=('i686' 'x86_64')
url='https://graph-tool.skewed.de'
license=(GPL3)
depends=(boost python3 expat python3-scipy python3-numpy cgal cairomm python-cairo)
makedepends=(sparsehash cairomm python-cairo autoconf-archive)
optdepends=('graphviz: graph layout'
'python-matplotlib: graph drawing')
provides=(python3-graph-tool)
conflicts=(python3-graph-tool)
replaces=(python3-graph-tool)
options=(!libtool)
source=("http://downloads.skewed.de/graph-tool/graph-tool-$pkgver.tar.bz2"
        "0001-Fix-dlopen-flags-problem-with-Python-3.6.patch")
sha256sums=('eba1090f94b0434890beedaf0c100dd0fc77e41ebfe29b4725d76cadb82099af'
            'a594d8f0c6b7abc6357bc25e2e4b87bf92710ebab0f240d70cffd936d94cc7cd')
prepare() {
  cd "$srcdir/graph-tool-$pkgver"
  patch -p1 -i $srcdir/0001-Fix-dlopen-flags-problem-with-Python-3.6.patch
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
