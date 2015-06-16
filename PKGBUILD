pkgname=osmium
pkgver=r888.76cdda0
pkgrel=1
pkgdesc="C++/Javascript framework for working with OSM files"
arch=(i686 x86_64)
url="https://github.com/joto/osmium"
license=(GPL LGPL)
depends=(osm-binary boost zlib shapelib sqlite gd expat gdal geos sparsehash v8-3.15 icu)
makedepends=(git doxygen)
source="git+https://github.com/joto/osmium.git"
md5sums=('SKIP')

pkgver() {
  cd osmium
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd osmium
  make
  make -C osmjs
  make -C examples
  make doc
}

package() {
  cd osmium

  make install DESTDIR="$pkgdir"
  make -C osmjs install DESTDIR="$pkgdir"

  rm examples/*.cpp
  cp examples/osmium_* "$pkgdir/usr/bin"
}
