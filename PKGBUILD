# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=shiba-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Rich markdown live preview app with linter.This application is being re-written from scratch to V2,using Rust, TypeScript and React"
arch=('x86_64')
url="https://github.com/rhysd/Shiba"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('gcc-libs' 'libxfixes' 'libxcomposite' 'libxext' 'libxrandr' 'pango' 'cairo' 'glibc' 'nspr' 'at-spi2-core' 'dbus' 'libxcursor' 'libxss' \
    'libxtst' 'libxrender' 'libxdamage' 'fontconfig' 'libcups' 'glib2' 'libx11' 'libxi' 'expat' 'gdk-pixbuf2' 'alsa-lib' 'gtk3' 'nss' 'libxcb')
makedepends=('gendesk')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/Shiba-linux-x64.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/master/build/images/shibainu.png")
sha256sums=('bce114feb8b6fccb6db4c933ed48d5fd0040c04ed30e16441b188320963d6fb7'
            'e94cd67aa4ba4e9ba4a90c939e3597caed218434e7d4c1e354495508bc1eae38')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/Shiba-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f --icon "${pkgname%-bin}" --categories "Utility" --name "Shiba" --exec "/opt/${pkgname%-bin}/Shiba %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}