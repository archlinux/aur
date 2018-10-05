# Maintainer: Amish <contact at via dot aur>
pkgname=xtables-geoip-db
pkgver=0.1
pkgrel=9
pkgdesc="GeoIP Database for xtables."
arch=('any')
license=('BSD' 'GPL')
url="https://dev.maxmind.com/geoip/geoip2/geolite2/"
depends=('xtables-addons-dkms')
makedepends=('perl-text-csv-xs' 'perl-net-cidr-lite')

prepare() {
	mkdir "${srcdir}/${pkgname}-${pkgver}"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
        sh /usr/lib/iptables/xtables-addons/xt_geoip_dl
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"/GeoLite2-Country-CSV_*
	install -d -m 755 "${pkgdir}/usr/share/xt_geoip"
	perl /usr/lib/iptables/xtables-addons/xt_geoip_build -D "${pkgdir}/usr/share/xt_geoip"
}
