# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=graycrown-bin
_appname=Graycrown
pkgver=1.2.1
pkgrel=6
pkgdesc="A simple game launcher for games.Old Coal. Now revived with a new name!"
arch=('x86_64')
url="https://zeankundev.github.io/graycrown"
_ghurl="https://github.com/zeankundev/graycrown"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron20'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('8b752cf3803eceb1bdd8f09ab3f8c49801e3f169d0720b67ef0b5be628960c1a'
            'daf38d3a81f9bebb9bfd4f3c0145c138c8552f688314505c25b0617d41f6dcb2')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_appname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}//opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}