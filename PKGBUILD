# Maintainer: Aleksandar Trifunovic <akstrfn@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=osm2pgsql
pkgver=1.9.0
pkgrel=3
pkgdesc="tool for loading OpenStreetMap data into a PostgreSQL / PostGIS database"
arch=('x86_64')
url="https://osm2pgsql.org/"
license=('GPL')
depends=('boost-libs' 'expat' 'geos' 'proj' 'postgresql-libs' 'zlib')
makedepends=('boost' 'cmake' 'lua' 'nlohmann-json')
optdepends=('lua: used for Lua tag transforms'
	        'postgresql: for creating a PostgreSQL database'
	        'postgis: for creating a PostGIS database')
source=("https://github.com/openstreetmap/osm2pgsql/archive/$pkgver.tar.gz")
sha256sums=('f568618809930d550fc21a1951180b58b72c091235e4b0bc93477e4c27d54e88')

prepare() {
    cmake -B build -S "${pkgname}-${pkgver}" \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=Release
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
