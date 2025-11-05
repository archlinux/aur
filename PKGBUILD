# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Adam Perkowski <adas1per@protonmail.com>

_pkgauthor=aspasht
_pkgname=smriti
pkgname=${_pkgname}-bin
pkgver=1.0.0
pkgrel=3
_pkgvername=v${pkgver}
pkgdesc="Keep track of the commands your memory missed"
arch=('x86_64')
_barch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('gcc-libs' 'glibc' 'sqlite')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.txz::${url}/releases/download/${_pkgvername}/cli-${_barch[0]}-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('e30924be0aa84d884abf7afd4c453f59349c4a6b5f04f8ac7556fe950c48a639')

prepare() {
	mv "cli-${CARCH}-unknown-linux-gnu" "${_pkgname}-${pkgver}"
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
