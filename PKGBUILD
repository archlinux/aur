# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Contributor: Malina Salina <bluesilence@hotmail.co.uk>
pkgname='reop'
pkgver='2.1.0'
pkgrel='1'
pkgdesc='Utility to create and verify cryptographic signatures'
url='https://github.com/tedu/reop/'
license=('MIT')
arch=('arm' 'i686' 'x86_64')
depends=('libsodium')
options=('zipman')
source=("https://github.com/tedu/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tgz")
sha512sums=('074302f7805711983864ece8aed1136458e7028ffd51edb2bb0352589b9e4d17ec5f530ad01b9a057afe57a351ecfb9d23d146a531aba6eb13dd51cf41fd9fcc')


build () {
	cd "${pkgname}-${pkgver}"
	make
}

check () {
	cd "${pkgname}-${pkgver}/tests"
	chmod +x test.sh
	./test.sh
}

package () {
	cd "${pkgname}-${pkgver}"
	install -Dm755 reop "${pkgdir}/usr/bin/reop"
	install -Dm644 reop.1 "${pkgdir}/usr/share/man/man1/reop.1"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
