# Maintainer: Aleksandar Trifunovic <akstrfn@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=osm2pgsql
pkgver=1.7.0
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
source=("https://github.com/openstreetmap/osm2pgsql/archive/$pkgver.tar.gz")
sha256sums=('0f722baf0f04eda387d934d86228aae07d848993900db6b9e7ab312c91fd84e5')

build() {
  cmake -B build -S "$srcdir/$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir/" install
}
