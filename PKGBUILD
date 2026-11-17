# Maintainer: BlackFuffey <fluffistical@gmail.com>

pkgname=(sable-web)
pkgver=26.11.2
pkgrel=1
pkgdesc='A Matrix client built to enhance user experience'
url='https://git.sable.moe/SableClient/sable-next'
license=(AGPL-3.0)

arch=(any)

depends=()
makedepends=(mise)

source=(sable-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha512sums=('93cf13e23d6ac4b91b83d39e5c9c2e11b41ce226a76e0cade660c2efc0e65a2490acb2a75e7ed7daf05d685064ba343466db3f637adfab206a620f28119c3f60')

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
