# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=leahneukirchen
pkgname=snooze
pkgver=0.6
pkgrel=1
pkgdesc="Run a command at a particular time"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('CC0')

provides=("${pkgname}")
makedepends=('git' 'make' 'gcc')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3a4a2f3f00d42e30647d9af79c8e417990ced6c3f0565474b1ca717938b1e2ab')


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
