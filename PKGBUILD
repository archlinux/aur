# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=geforcenow-electron-bin
_appname="com.github.hmlendea.${pkgname%-bin}"
pkgver=1.13.0
pkgrel=2
pkgdesc="Linux Desktop client for Nvidia's GeForce NOW game streaming service"
arch=('x86_64')
url="https://github.com/hmlendea/gfn-electron"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux.zip"
    "${pkgname%-bin}.sh")
sha256sums=('cc0190621b8966c84b838be0518e264081757a90ad55a77a1289f8af8cf10088'
            'c7a6d768bfeebcf52c791e38531bbb1b0225c49fdf173e2877181563af5a96f7')
prepare() {
    asar pack "${srcdir}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g;s|nvidia|${pkgname%-bin}|g" \
        -i "${srcdir}/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}