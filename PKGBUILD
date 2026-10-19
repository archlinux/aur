# Maintainer: BlackFuffey <fluffistical@gmail.com>

pkgname=(sable-web)
pkgver=2.0.3
pkgrel=1
pkgdesc='A Matrix client built to enhance user experience'
url='https://git.sable.moe/SableClient/sable-next'
license=(AGPL-3.0)

arch=(any)

depends=()
makedepends=(mise)

source=(sable-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha512sums=('6da145d631420a250e8bb3aec68033e67d94c686bda5b76d1b0b9a4f335422adc65dc0acdb2450c17675f8e02b40304ce4ff2f43391584e025359b11aa3a2294')

prepare() {
        cd "${srcdir}"/"sable-next"

        git init

        mise install
        mise run setup
}

build() {
	cd "sable-next"

        mise run build
}

package() {
	backup=('etc/webapps/sable/config.json')
	cd "sable-next"
	install -d "$pkgdir/usr/share/webapps/sable"
	cp -r dist/* "$pkgdir/usr/share/webapps/sable"
	install -d "$pkgdir/etc/webapps/sable"
	mv "${pkgdir}/usr/share/webapps/sable/config.json" \
		"${pkgdir}/etc/webapps/sable/config.json"
	ln -sfr "${pkgdir}/etc/webapps/sable/config.json" \
		"${pkgdir}/usr/share/webapps/sable/config.json"
}
