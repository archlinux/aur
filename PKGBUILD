# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="poddycast-bin"
pkgver=0.10.0
pkgrel=1
pkgdesc="Podcast app made with Electron, lots of ❤️ and ☕️"
arch=("x86_64")
url="https://github.com/MrChuckomo/poddycast"
license=('GPL3')
depends=('nspr' 'gcc-libs' 'libxkbcommon' 'nss' 'alsa-lib' 'glib2' 'pango' 'gtk3' 'libxext' 'nodejs' 'libx11' 'expat' 'libdrm' 'at-spi2-core'\
    'dbus' 'libxcomposite' 'glibc' 'cairo' 'libxdamage' 'mesa' 'gdk-pixbuf2' 'libxshmfence' 'libxrandr' 'libxcb' 'libxfixes' 'libcups')
conflit=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/Poddycast-linux-x64.zip")
sha256sums=('e3e8e4c3df091f94d042b355119d7474b7542a79d8d7c614774bfe35e0249d3d')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/Poddycast-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/resources/app/img/${pkgname%-bin}-app_icon.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility;AudioVideo" --name "Poddycast" --exec "/opt/${pkgname%-bin}/Poddycast --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}