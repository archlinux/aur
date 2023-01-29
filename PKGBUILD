# Maintainer: Aleksandar Trifunovic <akstrfn@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=osm2pgsql
pkgver=1.8.0
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
sha256sums=('b266b50f46fe4d1caddab61d26b39f10ea33b896ec23b8b3e294be4666e7b927')

prepare() {
    cmake -B build -S "${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir/" cmake --install build
}
