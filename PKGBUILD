# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname=osm2pgsql
pkgver=1.4.1
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
sha256sums=('33c4817dceed99764b089ead0e8e2f67c4c6675e761772339b635800970e66e2')

build() {
  cmake -B build -S "$srcdir/$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
