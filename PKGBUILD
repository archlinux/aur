# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Josh VanderLinden <arch@cloudlery.com>
# Contributor: Nicolas Storme <nicolas@atelier-web.com>

pkgname=goaccess-legacy
pkgver=1.10.2
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
sha512sums=('b69fdd0d6c0ca10cd1d89b1bc802b6076c218b06e858077ec0b63aa0851bbdc859561cf9ac41923475769ab91f1ba54ed310cebf7a9c314afee4fda0baaface6')

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
