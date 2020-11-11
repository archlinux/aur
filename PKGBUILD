# Maintainer: Raphael Dümig <duemig@in.tum.de>

pkgname=osm2pgsql-git
pkgver=1.3.0.r110.g639a7d1f
pkgrel=1
pkgdesc="tool for loading OpenStreetMap data into a PostgreSQL / PostGIS database"
arch=('i686' 'x86_64')
url="https://github.com/openstreetmap/osm2pgsql"
license=('GPL')
depends=('expat' 'proj' 'bzip2' 'zlib' 'boost-libs' 'postgresql-libs' 'lua')
makedepends=('git' 'cmake' 'boost' 'postgresql')
optdepends=('postgresql: for creating a PostgreSQL database'
            'postgis: for creating a PostGIS database')
source=("$pkgname::git+https://github.com/openstreetmap/osm2pgsql.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -B build -S "$pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
