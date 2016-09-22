# Maintainer: Tiago de Paula Peixoto <tiago@skewed.de>

# Remove the --enable-openmp flag below if you do not want parallelization.

pkgname=python2-graph-tool
pkgver=2.18
pkgrel=1
pkgdesc='A Python module for manipulation and statistical analysis of graphs'
arch=('i686' 'x86_64')
url='https://graph-tool.skewed.de'
license=(GPL3)
depends=(boost python2 expat python2-scipy python2-numpy cgal cairomm python2-cairo)
makedepends=(sparsehash)
optdepends=('graphviz: graph layout'
'python2-matplotlib: graph drawing')
options=(!libtool)
source=("http://downloads.skewed.de/graph-tool/graph-tool-$pkgver.tar.bz2" "0001-Fix-compilation-problem-with-newer-CGAL.patch")
sha256sums=('3c4929fb7b6bae13a12115afdf8c07d6531aeeba548305376ba7b0ac710ec4d4'
            '6d325261f5e592c45c8eafb5c0b82d28e16fe4a11335d2c0c49f8e3439007f09')

prepare() {
  cd "$srcdir/graph-tool-$pkgver"
  patch -Np1 < ../0001-Fix-compilation-problem-with-newer-CGAL.patch
  ./configure --enable-openmp --prefix=/usr --docdir="/usr/share/doc/$pkgname" PYTHON=python2
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
