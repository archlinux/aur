# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname=osm2pgsql
pkgver=1.4.2
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
sha256sums=('fc68283930ccd468ed9b28685150741b16083fec86800a4b011884ae22eb061c')

build() {
  cmake -B build -S "$srcdir/$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir/" install
}
