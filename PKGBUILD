# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=space-snake-bin
pkgver=0.11.1
pkgrel=1
pkgdesc="A Desktop game built with Electron and Vue.js."
arch=('x86_64')
url="https://github.com/ilyagru/Space-Snake"
license=('MIT')
depends=('libcups' 'libxtst' 'libxcb' 'glibc' 'fontconfig' 'libxi' 'alsa-lib' 'libxdamage' 'gdk-pixbuf2' 'nspr' 'expat' \
    'at-spi2-core' 'gtk2' 'glib2' 'libxcursor' 'libx11' 'dbus' 'pango' 'libxext' 'nss' 'libxrandr' 'libxrender' 'freetype2' \
    'gcc-libs' 'libxfixes' 'libxss' 'libxcomposite' 'cairo')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/Space-Snake-linux-x64-v${pkgver}.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/ilyagru/Space-Snake/master/app/icons/icon.png")
noextract=("${pkgname%-bin}-${pkgver}.zip")
sha256sums=('b4ed62ff9b5dc3cc815f0ac5328dc602ce29f6bb3231beab622c246c7c2554f9'
            '2cf69008e16f9f81098eaed1b59e481bafb258606cc9171047db9b6fdec6cb9f')
 
package() {
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/Space-Snake-linux-x64-v${pkgver}"/*  "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f --icon "${pkgname%-bin}" --categories "Game" --name "Space-Snake" --exec '/opt/space-snake/Space Snake'
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
