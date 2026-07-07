# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=paulrobello
_pkgname=par-fractal
pkgname=${_pkgname}-bin
pkgdesc="Cross-platform GPU-accelerated fractal renderer built with Rust and WebGPU"

pkgver=0.8.3
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("${_pkgname}.desktop"
		"ICON-${pkgver}.png::${_urlraw}/icons/mstile-150x150.png"
		"README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('c11bcc47bd001ee68144fc97d1a6812d7b62d4d01798e2f6e787a6f8e98bba8d'
            '7f951272ea9e210bff0ad22095ef3761f5973a98a0e08a54744100da427df891'
            'f33b0aa6baa80b923b879d184d387390e61acdf1d682802b1195e3c840eceb0c'
            '7517f84253241eb992f31ea2fb3cfe12a1dad6acfd5a0884f98506f5dfc9f75b')
sha256sums_x86_64=('8640e547ddc792f94b63a3c13a5b4984cdae043b3dab5432bc31820d0670bf90')
sha256sums_aarch64=('9ca794f5a87646b8095dee770c12d6e5d95ee6daa84253dceecd128f899a34ce')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	install -Dm644 "ICON-${pkgver}.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
