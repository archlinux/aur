# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=thewizardshell
_pkgname=froggit
pkgname=${_pkgname}-bin
pkgver=1.3.0
_pkgver="${pkgver}-beta"
pkgrel=1
pkgdesc="Simplify your Git workflow with visual feedback, keyboard-driven controls, and a streamlined experience"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${_pkgver}"
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/v${_pkgver}/linux-${_barch[0]}.zip")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.zip::${url}/releases/download/v${_pkgver}/linux-${_barch[1]}.zip")
sha256sums=('b871ca9318bdbb611164e4e2d53651960cda18d6579d785c97b2185508f8c338'
            '1d8cd3f5a4d9207d0ce48eb3e7c0741402897106f63797f86135a22e9da66190')
sha256sums_x86_64=('88c1db044b60d1ab78273d4854995f613fc1f99f9cdcea627435eeb2a8ef71d8')
sha256sums_aarch64=('f24774e86353fe3534fc3f53475af31b75a2047e11d71726376076abb2572c30')

prepare() {
	cd "${srcdir}/" || exit

	mv "${_pkgname}-linux-"* "${_pkgname}-${CARCH}-${pkgver}"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
