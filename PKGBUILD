# Maintainer: Joakim Repomaa <aur@j.repomaa.com>

pkgbase=osmtools
pkgname=(osmconvert osmfilter osmupdate)
pkgver=0.9
pkgrel=2
pkgdesc='Simple tools which are used in OpenStreetMap project'
arch=('x86_64')
url='https://gitlab.com/osm-c-tools/osmctools'
license=('AGPL')
depends=('zlib')
makedepends=('git')
source=("$pkgbase::git+$url#tag=$pkgver")
sha256sums=('SKIP')
conflicts=('osmctools')

build() {
	cd "$pkgbase"
	autoheader -f
	aclocal
	autoconf -f
	automake --add-missing -c
	./configure
	make
}

package_osmconvert() {
	cd "$pkgbase/src"
	install -Dm755 osmconvert "$pkgdir/usr/bin/osmconvert"
}

package_osmfilter() {
	cd "$pkgbase/src"
	install -Dm755 osmfilter "$pkgdir/usr/bin/osmfilter"
}

package_osmupdate() {
	cd "$pkgbase/src"
	install -Dm755 osmupdate "$pkgdir/usr/bin/osmupdate"
}
