# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Flexible terminal-based text editor'
pkgname=mle
pkgver=1.4.3
pkgrel=1
url='https://github.com/adsr/mle'
license=(Apache)
arch=(x86_64)
conflicts=(mle-git)
depends=(pcre termbox lua53)
makedepends=(uthash)
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('014a8834a088f410a9ef5cd213140f1e4386726bd277f5fdffdfff8165cd1460ede54d5cb62a26bdef804391a524d398a439977b8f82add3d365936a3c5505ab')

build () {
	cd "${pkgname}-${pkgver}"
	make prefix=/usr
}

check () {
	cd "${pkgname}-${pkgver}"
	make test
}

package () {
	cd "${pkgname}-${pkgver}"
	make prefix=/usr DESTDIR="${pkgdir}" install
	install -Dm644 mle.1 "${pkgdir}/usr/share/man/man1/mle.1"
}
