# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="silence-speedup-bin"
pkgver=1.2.5
pkgrel=2
pkgdesc="Speed-up your videos speeding-up (or removing) silences, using FFmpeg. This is an electron-based app."
arch=("x86_64")
url="https://vincenzopadula.altervista.org/silence-speedup/"
_githuburl="https://github.com/padvincenzo/silence-speedup"
license=('GPL3')
depends=('bash' 'electron16' 'hicolor-icon-theme')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}_amd64.zip::${_githuburl}/releases/download/v${pkgver}/Silence-SpeedUp-v${pkgver}-linux-x64.zip"
    "${pkgname%-bin}.sh")
sha256sums=('2f88c27b08084064ad8477f6744dc8592ea1d4bc5dba74437710871ece1d9653'
            '411f0de947dac8a6b35637d70d758586c2b865b60aa0ea3505a232d4983f6c9b')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/Silence-SpeedUp-v${pkgver}-linux-x64/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/Silence-SpeedUp-v${pkgver}-linux-x64/resources/app/assets/icons/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "AudioVideo;Utility" --name "Silence SpeedUp" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}