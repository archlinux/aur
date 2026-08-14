# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ralsina
_pkgname=hace
pkgname=${_pkgname}-bin
pkgver=0.8.4
pkgrel=1
pkgdesc="A task-launching app (think make)"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-${_barch[0]}")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-${_barch[1]}")
sha256sums=('e50dacbce1f6e8737ee91f43aa0b3a322aabda7e15ea0011b4059cb51dc9a274'
            '9371b6b434a148fb071914116e08bdf8fcb86fbb79438342110c3d2b9af28b71'
            '3e86827deeaef5cb525f20b6d0e8ad0630278332c28d37c9a0d79e05809c1124')
sha256sums_x86_64=('bb7598d5e509464930527d672ec8f7220bf9382d955a3bffb0f8937e052075b7')
sha256sums_aarch64=('baeef5c213153544f529b195d1a4dc4635be46c047c2f7bf0d243d25fd6fc1a7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-static-linux-"* "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
