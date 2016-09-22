# Maintainer: Tiago de Paula Peixoto <tiago@skewed.de>

# Remove the --enable-openmp flag below if you do not want parallelization.

pkgname=python-graph-tool
pkgver=2.18
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
source=("http://downloads.skewed.de/graph-tool/graph-tool-$pkgver.tar.bz2" "0001-Fix-compilation-problem-with-newer-CGAL.patch")
sha256sums=('3c4929fb7b6bae13a12115afdf8c07d6531aeeba548305376ba7b0ac710ec4d4'
            '6d325261f5e592c45c8eafb5c0b82d28e16fe4a11335d2c0c49f8e3439007f09')

prepare() {
  cd "$srcdir/graph-tool-$pkgver"
  patch -Np1 < ../0001-Fix-compilation-problem-with-newer-CGAL.patch
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
