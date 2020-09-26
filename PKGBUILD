# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname=osm2pgsql
pkgver=1.3.0
pkgrel=1
pkgdesc="tool for loading OpenStreetMap data into a PostgreSQL / PostGIS database"
arch=('x86_64')
url="https://osm2pgsql.org/"
license=('GPL')
depends=('boost-libs' 'expat' 'geos' 'proj' 'postgresql-libs' 'zlib')
makedepends=('boost' 'cmake' 'lua')
optdepends=('lua: used for Lua tag transforms'
	'postgresql: for creating a PostgreSQL database'
	'postgis: for creating a PostGIS database')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openstreetmap/osm2pgsql/archive/$pkgver.tar.gz")
sha256sums=('1c0f229047491cf7d054c6f8fcb846eb3163c336340fa82035e19cc2bb7f0179')

build() {
  cmake -B build -S "$srcdir/$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
