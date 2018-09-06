# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Tiago de Paula Peixoto <tiago@skewed.de>

_pkgname=python-graph-tool
pkgname=python-graph-tool-git
pkgver=release.2.27.r7.g41bae98c
pkgrel=1
pkgdesc='A Python module for manipulation and statistical analysis of graphs'
arch=('i686' 'x86_64')
url='https://graph-tool.skewed.de'
license=(GPL3)
depends=(cgal cairomm python-scipy python-numpy python-cairo)
makedepends=(boost sparsehash autoconf-archive)
optdepends=('graphviz: graph layout'
            'python-matplotlib: graph drawing')
provides=("$_pkgname")
conflicts=(python3-graph-tool)
replaces=(python3-graph-tool)
options=(!libtool)
source=("$pkgname::git+https://git.skewed.de/count0/graph-tool.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  ./autogen.sh
  ./configure --enable-openmp --prefix=/usr --docdir="/usr/share/doc/$_pkgname"
  make -j 1  # most users will be surprised with the high memory usage required for parallel builds
}

check() {
  cd "$pkgname"
  make check
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}
