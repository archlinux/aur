# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Disservin
_pkgname=fastchess
pkgname=${_pkgname}
pkgver=1.7.0_alpha
pkgrel=1
_pkgver=${pkgver//_/-}
pkgdesc="A chess cli tool to run engine vs engine matches"
arch=(any)
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('MIT')

provides=("${pkgname}")
makedepends=('gcc' 'make')
depends=('glibc' 'gcc-libs')

source=("${_pkgname}-${_pkgver}.tgz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('589f541a9561d1ab7e80393e594b8e62ab6f1501ed2f3bdf6da27d4d560f9eeb')

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
