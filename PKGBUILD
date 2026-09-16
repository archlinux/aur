# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Josh VanderLinden <arch@cloudlery.com>
# Contributor: Nicolas Storme <nicolas@atelier-web.com>

pkgname=goaccess-legacy
pkgver=1.12
pkgrel=1
pkgdesc="An open source real-time web log analyzer and interactive viewer (lagacy)"
arch=('x86_64')
url='https://goaccess.io'
license=('MIT')
depends=(
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
sha512sums=('e20bc4cc7ab09e57a13c958e08f5e3ac6df42e02edab2e46df6c910b8bc8eb15de72374e3c7dc83bdbb962aedfb717870ceec509514c3532d796b612bcab9c70')

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
