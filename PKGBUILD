# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname=osm2pgsql
pkgver=1.5.1
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
sha256sums=('4df0d332e5d77a9d363f2f06f199da0ac23a0dc7890b3472ea1b5123ac363f6e')

build() {
  cmake -B build -S "$srcdir/$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir/" install
}
