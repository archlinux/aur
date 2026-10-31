# Maintainer: BlackFuffey <fluffistical@gmail.com>

pkgname=(sable-web)
pkgver=2.2.3
pkgrel=1
pkgdesc='A Matrix client built to enhance user experience'
url='https://git.sable.moe/SableClient/sable-next'
license=(AGPL-3.0)

arch=(any)

depends=()
makedepends=(mise)

source=(sable-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha512sums=('5df2fb4833d07dc5890db4c7e494da3be38bfc8722f06f4892ae3d2b379b4b2ea1c0d6b480169dc289bcdcf67047299ebd5c761c036111aee56ed0450513bc1c')

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
