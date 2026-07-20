# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Josh VanderLinden <arch@cloudlery.com>
# Contributor: Nicolas Storme <nicolas@atelier-web.com>

pkgname=goaccess-legacy
pkgver=1.11
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
sha512sums=('acf0b8d588c7d8839d4e3ff626a308b64d7f3ca78cb942a77eac2fff1172aa2b03bd26b3c18f823ec296bb641a8a0ecfc2f77ace68200549c9ffa16b8af1da2e')

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
