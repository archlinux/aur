# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Disservin
_pkgname=fastchess
pkgname=${_pkgname}
pkgver=1.8.2
pkgrel=1
_pkgver="${pkgver}-alpha"
pkgdesc="A chess cli tool to run engine vs engine matches"

arch=(any)
license=('MIT')
url="https://github.com/${_pkgauthor}/${pkgname}"

provides=("${pkgname}")
makedepends=('gcc' 'make')
depends=('glibc' 'gcc-libs')

source=("${_pkgname}-${_pkgver}.tgz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('9dad5dcea3009e65f3c9cfc6f901ab40d6b36d572368d95acea079812e3b9a88')

build() {
	cd ${pkgname}-${_pkgver} || exit 1

	make
}

package() {
	cd ${srcdir}/${pkgname}-${_pkgver} || exit 1

	make PREFIX="${pkgdir}/usr" install

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
