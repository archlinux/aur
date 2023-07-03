# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=angular-electron-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="Bootstrap and package your project with Angular 15 and Electron 21 (Typescript + SASS + Hot Reload) for creating Desktop applications."
arch=('x86_64')
url="https://github.com/malacration/sap-front"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('cairo' 'libx11' 'libxcb' 'libdrm' 'libcups' 'gcc-libs' 'alsa-lib' 'libxext' 'libxkbcommon' 'at-spi2-core' 'glibc' \
    'gtk3' 'libxfixes' 'nss' 'libxcomposite' 'expat' 'pango' 'glib2' 'mesa' 'libxrandr' 'dbus' 'libxdamage' 'nspr')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-12.0.0.tar.gz"
    "LICENSE.md::https://raw.githubusercontent.com/malacration/sap-front/main/LICENSE.md"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/malacration/sap-front/main/src/assets/icons/favicon.512x512.png")
sha256sums=('bd4a8cf2599295d691e595440050ac5130b7ecc01cd02df58a3fb1026de11ae9'
            '00df8834a94ab4d44c7c7d6557cce6af143ed0019a80c682b5a03d0cea8187b4'
            'e88e5f0dc9ca423464c686e2100c7ff48e88474401f099086151a3b13be52c4b')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-12.0.0/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f --icon "${pkgname%-bin}" --categories "Development;Utility" --name "Angular Electron" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}