# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=geforcenow-electron-bin
_appname=com.github.hmlendea.geforcenow-electron
pkgver=1.12.0
pkgrel=2
pkgdesc="Linux Desktop client for Nvidia's GeForce NOW game streaming service"
arch=('x86_64')
url="https://github.com/hmlendea/gfn-electron"
license=('GPL3')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron24')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux.zip"
    "${pkgname%-bin}.sh")
sha256sums=('b71ddb2ff71db532e2b1eddf13175bb450f22dd0cbfc7032bfc9c673ab84abf7'
            'e546712b9f73a5af184b3bfd0d4c25e89446ee8a8532acc77bf2040168abad22')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    sed "s|nvidia|${pkgname%-bin}|g" -i "${srcdir}/${_appname}.desktop"
    install -Dm644 "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}