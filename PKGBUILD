# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Josh VanderLinden <arch@cloudlery.com>
# Contributor: Nicolas Storme <nicolas@atelier-web.com>

pkgname=goaccess-legacy
pkgver=1.10.1
pkgrel=1
pkgdesc="An open source real-time web log analyzer and interactive viewer (lagacy)"
arch=('x86_64')
url='https://goaccess.io'
license=('MIT')
depends=(
	'glibc'
	'geoip'
	'ncurses'
	'openssl'
)
makedepends=('git')
provides=(goaccess)
conflicts=(goaccess)
optdepends=(
	'geoip-database: GeoIP legacy country database (based on GeoLite2 data created by MaxMind)'
	'geoip-database-extra: GeoIP legacy city/ASN databases (based on GeoLite2 data created by MaxMind)'
)
backup=('etc/goaccess/goaccess.conf')
source=("${pkgname}::git+https://github.com/allinurl/goaccess.git#tag=v${pkgver}")
sha512sums=('26e69f9078861889c0ef006f2e797d6267e09d04ef4ae531db510e0d72389e22e1e6216961aa0c8e7bcb54cc8cd6658c1eee90d56ba7dcd274ab960b4be377b4')

prepare() {
	cd $pkgname
	autoreconf -fiv
}

build() {
	cd $pkgname
	./configure --enable-geoip=legacy --enable-utf8 --with-openssl
	make prefix=/usr sysconfdir=/etc
}

package() {
	cd $pkgname
	make prefix="$pkgdir/usr" sysconfdir="$pkgdir/etc" install
}
