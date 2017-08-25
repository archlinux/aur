# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=libosmium
pkgver=2.13.1
pkgrel=1
pkgdesc="Fast and flexible C++ library for working with OpenStreetMap data."
url="http://osmcode.org/libosmium/"
arch=('x86_64' 'i686')
license=('custom')
depends=('expat' 'zlib' 'bzip2' 'boost' 'boost-libs')
optdepends=('sparsehash: sparse-mem-table index map'
            'gdal: convert OSM geometries into OGR geometries'
            'geos: convert OSM geometries into GEOS geometries'
            'proj: project OSM coordinates into spatial reference systems'
            'doxygen: build Libosmium API documentation')
conflicts=('libosmium-git')
provides=('libosmium')
source=("https://github.com/osmcode/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake \
        -DINSTALL_GDALCPP=ON \
        -DINSTALL_PROTOZERO=ON \
        -DINSTALL_UTFCPP=ON \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX:PATH=/usr \
	..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha1sums=('b270d5e59bf26e6e494ad5c4530ad01c5254ec51')
sha256sums=('a73cd56838a7438bd9ed208c9ce6794e2d55a1854039c4277a0c160d5071b909')
