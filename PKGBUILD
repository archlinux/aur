# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="silence-speedup-bin"
pkgver=1.2.5
pkgrel=1
pkgdesc="Speed-up your videos speeding-up (or removing) silences, using FFmpeg. This is an electron-based app."
arch=("x86_64")
url="https://vincenzopadula.altervista.org/silence-speedup/"
_githuburl="https://github.com/padvincenzo/silence-speedup"
license=('GPL3')
depends=('gcc-libs' 'glib2' 'nss' 'bash' 'alsa-lib' 'libdrm' 'libxcb' 'libcups' 'cairo' 'nodejs' \
    'libxrandr' 'mesa' 'libxext' 'gtk3' 'libxfixes' 'libxkbcommon' 'libxdamage' 'gdk-pixbuf2' \
    'hicolor-icon-theme' 'at-spi2-core' 'dbus' 'libx11' 'nspr' 'libxcomposite' 'pango' 'expat' 'glibc')
source=("${pkgname%-bin}-${pkgver}_amd64.zip::${_githuburl}/releases/download/v${pkgver}/Silence-SpeedUp-v${pkgver}-linux-x64.zip")
sha256sums=('2f88c27b08084064ad8477f6744dc8592ea1d4bc5dba74437710871ece1d9653')
      
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/Silence-SpeedUp-v${pkgver}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/resources/app/assets/icons/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    gendesk -f --icon "${pkgname%-bin}" --categories "AudioVideo;Utility" --name "Silence SpeedUp" --exec '"/opt/silence-speedup/Silence SpeedUp" %U'
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}