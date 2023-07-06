# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=angular-electron-bin
pkgver=1.2.3
pkgrel=1
pkgdesc="Bootstrap and package your project with Angular 15 and Electron 21 (Typescript + SASS + Hot Reload) for creating Desktop applications."
arch=('x86_64')
url="https://github.com/malacration/sap-front"
license=('MIT')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('electron')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-12.0.0.tar.gz"
    "LICENSE.md::https://raw.githubusercontent.com/malacration/sap-front/main/LICENSE.md"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/malacration/sap-front/main/src/assets/icons/favicon.512x512.png"
    "${pkgname%-bin}.sh")
sha256sums=('7c49c17274773a65b726857f49f410b0b170c89ca3d0077dff83cda5c8573c69'
            '00df8834a94ab4d44c7c7d6557cce6af143ed0019a80c682b5a03d0cea8187b4'
            'e88e5f0dc9ca423464c686e2100c7ff48e88474401f099086151a3b13be52c4b'
            '342c23ee9e97a95c124321183d869a34f5c782e1814875a0eba0b0e1c974b170')
package() {
    install -Dm644 "${srcdir}/${pkgname%-bin}-12.0.0/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Development;Utility" --name "Angular Electron" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}