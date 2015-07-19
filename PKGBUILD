# Maintainer: Amish <contact at via dot aur>
pkgname=xtables-geoip-db
pkgver=0.1
pkgrel=4
pkgdesc="GeoIP Database for xtables."
arch=('any')
license=('BSD' 'GPL')
url="http://geolite.maxmind.com/download/geoip/database/"
depends=('xtables-addons-dkms')
makedepends=('perl-text-csv-xs')

prepare() {
	mkdir "${srcdir}/${pkgname}-${pkgver}"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
        sh /usr/lib/iptables/xtables-addons/xt_geoip_dl
}

package() {
	install -d -m 755 "${pkgdir}/usr/share/xt_geoip"
	cd "${srcdir}/${pkgname}-${pkgver}"
	perl /usr/lib/iptables/xtables-addons/xt_geoip_build -D "${pkgdir}/usr/share/xt_geoip" GeoIP*.csv
}
