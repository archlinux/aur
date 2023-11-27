# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=geforcenow-electron-bin
_appname="com.github.hmlendea.${pkgname%-bin}"
pkgver=2.0.0
pkgrel=2
pkgdesc="Linux Desktop client for Nvidia's GeForce NOW game streaming service"
arch=('x86_64')
url="https://github.com/hmlendea/gfn-electron"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron27'
    'python'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('4cfc47596035f96f702caf9b05bef909601ee08daa3d1a4d674d0384c87f2c2c'
            'eae362d8b9a29f4fdf62507da11c57c51b060aa31df336d7009103648d37c8cb')
build() {
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g;s|nvidia|${pkgname%-bin}|g" \
        -i "${srcdir}/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}