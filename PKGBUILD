# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="geforcenow-electron-bin"
pkgver=1.12.0
pkgrel=1
pkgdesc="Linux Desktop client for Nvidia's GeForce NOW game streaming service"
arch=('x86_64')
url="https://github.com/hmlendea/gfn-electron"
license=('GPL3')
conflicts=("${pkgname%-bin}")
depends=('electron24')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux.zip"
    "${pkgname%-bin}.sh")
sha256sums=('b71ddb2ff71db532e2b1eddf13175bb450f22dd0cbfc7032bfc9c673ab84abf7'
            'f98698b0418d869e12d27b89ff103042198ff542148ae482b9d65c57c596300e')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    sed "s|nvidia|${pkgname%-bin}|g" -i "${srcdir}/com.github.hmlendea.${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/com.github.hmlendea.${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}