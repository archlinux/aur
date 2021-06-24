# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Raphael Dümig <duemig@in.tum.de>

_pkgname=osm2pgsql
pkgname=$_pkgname-git
pkgver=1.5.0.r5.gd53d6567
pkgrel=2
pkgdesc="tool for loading OpenStreetMap data into a PostgreSQL / PostGIS database"
arch=('i686' 'x86_64')
url="https://github.com/openstreetmap/osm2pgsql"
license=('GPL')
depends=('expat' 'proj' 'bzip2' 'zlib' 'boost-libs' 'postgresql-libs' 'lua')
makedepends=('git' 'cmake' 'boost' 'postgresql')
optdepends=('postgresql: for creating a PostgreSQL database'
            'postgis: for creating a PostGIS database')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -B build -S "$_pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
