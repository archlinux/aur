# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Josh VanderLinden <arch@cloudlery.com>
# Contributor: Nicolas Storme <nicolas@atelier-web.com>

pkgname=goaccess-legacy
pkgver=1.9.4
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
sha512sums=('42d3f4d8bc11cba2858b45ab6f29ac41cd028f9df7bda18f67abd1e448ee2dc88bd628a4bb587ac0fc5c4224553ebc8925537bedc68d9a399e4ddd67bb1d5ead')

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
