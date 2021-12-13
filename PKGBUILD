# Maintainer: zezadas <zezadasmoreira at gmail dot com>

pkgname=gr-binviz-git
pkgver=v5.10ff87e
pkgrel=1
pkgdesc="A GNU Radio Companion out-of-tree module for visualization of char data types"
arch=('any')
url="https://github.com/CBrunsch/BinViz/tree/master/gr-binviz"
license=(unknown)
depends=('gnuradio<3.9' 'libosmocore' 'boost' 'swig' 'cimg' 'cppunit')
makedepends=('cmake')
provides=('gr-binviz')
source=('git+https://github.com/CBrunsch/BinViz.git') 
sha1sums=('SKIP')
_gitname=BinViz

pkgver() {
  cd $_gitname
  printf "v%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#prepare() {
  #patch -p0 -i ../utils_itpp.patch
#}

build() {
  cd $_gitname/gr-binviz
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$_gitname"/gr-binviz/build
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
