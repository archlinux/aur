# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=leahneukirchen
pkgname=snooze
pkgver=0.5.1
pkgrel=1
pkgdesc="Run a command at a particular time"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('CC0')

provides=("${pkgname}")
makedepends=('git' 'make' 'gcc')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('abb0df288e8fe03ae25453d5f0b723b03a03bcc7afa41b9bec540a7a11a9f93e')


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
