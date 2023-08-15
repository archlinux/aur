# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=translationcore-bin
pkgver=3.5.1
pkgrel=1
pkgdesc="An open source platform for checking and managing Bible translation projects"
arch=('aarch64' 'x86_64')
url="https://www.translationcore.com/"
_githuburl="https://github.com/unfoldingWord/translationCore"
license=('ISC')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25' 'hicolor-icon-theme')
makedepends=('asar')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/tC-linux-arm64-${pkgver}-MAX-6e1cd7b.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/tC-linux-x64-${pkgver}-MAX-6e1cd7b.deb")
source=("LICENSE::https://raw.githubusercontent.com/unfoldingWord/translationCore/develop/LICENSE"
        "${pkgname%-bin}.sh")
sha256sums=('a756bd73c46e3e9b85ff0222658f4c63851ebc5af63811adc4333ff618688417'
            'eb05b462f6b48d3b3e51622881942cff873d8a809ce030df46d6eaec2c40c724')
sha256sums_aarch64=('6df8af5f0a5a8249a52944f41685765ac576521d561e910cb81162b4bca144ae')
sha256sums_x86_64=('6a5423c5b368a0538e9809d3ad625b12d245ed88766c17a3126751a36585ebd4')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/opt/${pkgname%-bin}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|unfoldingword-${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/opt/${pkgname%-bin}/unfoldingword-${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/unfoldingword-${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16 22 32 48 64 128;do
        install -Dm644 "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}-${_icons}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}