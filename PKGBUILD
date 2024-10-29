# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=leahneukirchen
pkgname=snooze
pkgver=0.5
pkgrel=1
pkgdesc="Run a command at a particular time"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('CC0')

provides=("${pkgname}")
makedepends=('git' 'make' 'gcc')

source=("https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d63fde85d9333188bed5996baabd833eaa00842ce117443ffbf8719c094be414')


build() {
	cd ${pkgname}-${pkgver} || exit 1

	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	make PREFIX=/usr DESTDIR="${pkgdir}" install

	install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm 644 NEWS.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
