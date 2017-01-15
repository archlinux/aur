# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=libosmium
pkgver=2.11.0
pkgrel=1
pkgdesc="Fast and flexible C++ library for working with OpenStreetMap data."
url="http://osmcode.org/libosmium/"
arch=('x86_64' 'i686')
license=('custom')
depends=('expat' 'zlib' 'bzip2' 'boost-libs')
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

sha1sums=('dd8151dbf6b69ce8c83ef54c81911329ad53d79d')
sha256sums=('32e0b0725efa6a93cf2752862b6f32991eb0978eae793692aab202d7c4f7be4f')
