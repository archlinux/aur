# Maintainer: BlackFuffey <fluffistical@gmail.com>

pkgname=(sable-web)
pkgver=2.3.9
pkgrel=1
pkgdesc='A Matrix client built to enhance user experience'
url='https://git.sable.moe/SableClient/sable-next'
license=(AGPL-3.0)

arch=(any)

depends=()
makedepends=(mise)

source=(sable-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha512sums=('5bc10ef991897fd95517d83c490f958cad07b7f31b3049ed7313ed748e7baba88f603d7c865515ccce6543e352fef2d6266780de424f24e503abf2a71c64a283')

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
