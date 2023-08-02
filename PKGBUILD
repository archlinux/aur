# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="translationcore-bin"
pkgver=3.5.0_lite
_pkgver=3.5.0-LITE
pkgrel=1
pkgdesc="An open source platform for checking and managing Bible translation projects"
arch=('aarch64' 'x86_64')
url="https://www.translationcore.com/"
_githuburl="https://github.com/unfoldingWord/translationCore"
license=('ISC')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25' 'hicolor-icon-theme')
makedepends=('asar')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${_pkgver}/tC-linux-arm64-${_pkgver}-30831db.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${_pkgver}/tC-linux-x64-${_pkgver}-30831db.deb")
source=("LICENSE::https://raw.githubusercontent.com/unfoldingWord/translationCore/develop/LICENSE"
        "${pkgname%-bin}.sh")
sha256sums=('a756bd73c46e3e9b85ff0222658f4c63851ebc5af63811adc4333ff618688417'
            'eb05b462f6b48d3b3e51622881942cff873d8a809ce030df46d6eaec2c40c724')
sha256sums_aarch64=('6bfcbf759cbb01d7188610feff2788949c55f7081e2b3f915291dcc3b0ebf840')
sha256sums_x86_64=('bb5f2136182adcdd222eae72e1d2e6ca90dfa66c384b663e3855d393643a4c9d')
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