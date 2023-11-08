# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=silence-speedup-bin
_pkgname="Silence-SpeedUp"
pkgver=1.2.5
pkgrel=4
pkgdesc="An electron-based app,speed-up your videos speeding-up (or removing) silences, using FFmpeg."
arch=("x86_64")
url="https://vincenzopadula.altervista.org/silence-speedup/"
_ghurl="https://github.com/padvincenzo/silence-speedup"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron16'
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}_amd64.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x64.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('2f88c27b08084064ad8477f6744dc8592ea1d4bc5dba74437710871ece1d9653'
            'd4b5c1f6bcb62abb47abd8e7cde213042b0e40b412ea0b24b8673b6632de11d1')
build() {
    gendesk -q -f -n --categories "AudioVideo;Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-v${pkgver}-linux-x64/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    cp -r "${srcdir}/${_pkgname}-v${pkgver}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-v${pkgver}-linux-x64/resources/app/assets/icons/icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}