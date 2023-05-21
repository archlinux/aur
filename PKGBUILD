# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="mater-bin"
pkgver=1.0.10
pkgrel=1
pkgdesc="A simple menubar Pomodoro app"
arch=('x86_64')
url="https://github.com/jasonlong/mater"
license=('MIT')
conflicts=("${pkgname%-bin}")
depends=('libxkbcommon' 'glibc' 'libcups' 'libdrm' 'libxcb' 'gdk-pixbuf2' 'libxrandr' 'nss' 'at-spi2-core' 'libxfixes' 'gtk3' \
    'libxcomposite' 'nspr' 'mesa' 'libx11' 'alsa-lib' 'expat' 'pango' 'libxext' 'cairo' 'libxdamage' 'glib2' 'dbus' 'gcc-libs')
makedepends=('gendesk')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/Mater-linux-x64.zip")
sha256sums=('b26d8ef79fd92c95ac914e73af9504f06dcfaa204f62c47cc3d423a53fa32f8a')
   
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/Mater-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/resources/app/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f --icon "${pkgname%-bin}" --categories "Utility" --name "Mater" --exec "/opt/${pkgname%-bin}/Mater %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${pkgdir}/opt/${pkgname%-bin}/resources" -type f -exec chmod 644 {} \;
    find "${pkgdir}/opt/${pkgname%-bin}/resources" -type d -exec chmod 755 {} \;
}