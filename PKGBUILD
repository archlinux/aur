# Maintainer: Daniel Reibl <janos.daniel.reibl@pm.me>
pkgname=osm2pgrouting
pkgver=2.3.8
pkgrel=2
pkgdesc="Import tool for OpenStreetMap data to pgRouting database"
arch=('x86_64')
url="https://pgrouting.org"
license=('GPL')

depends=('libpqxx' 'expat')
makedepends=('boost' 'cmake')
source=("https://github.com/pgRouting/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('6334f80ffbea0288888b864ba787252b87b5fe446a3746003d79afc125fd526460e147a230b506d35609bac8136e7ea20eb5761ce3b8dee3355d23df8a8d62e5')

build() {
	cd "$pkgname-$pkgver"
	cmake -H. -Bbuild
	cd build
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
