# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=thewizardshell
_pkgname=froggit
pkgname=${_pkgname}-bin
pkgver=0.4.1
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
            '3e1e23f31427f7cc914a5de38b3d107c92da5a1410e70c143b957cbe139c11e7')
sha256sums_x86_64=('f56e552ab04308305b430e808f2fcdfed19c842021893bfb24a3320d67d1a406')
sha256sums_aarch64=('d5857ff93bf85beb7c2ab29a736321ca6f072734864d0eb8ed9af8d07b9c8f9f')

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
