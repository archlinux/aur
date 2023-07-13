# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="epherome-bin"
pkgver=0.7.1
pkgrel=2
pkgdesc="Powerful Minecraft Launcher"
arch=('x86_64')
license=('GPL3')
conflicts=("${pkgname%-bin}")
url="https://epherome.com/"
_githuburl="https://github.com/ResetPower/Epherome"
depends=('electron22')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/Epherome-${pkgver}.deb"
    "${pkgname%-bin}.sh")
sha256sums=('7dc740a18e73eb11aaa1ef7dad8342857ab043fb81112dac36129a1f895e49a5'
            '27f62dc41f3ef267428cd283b3149c6e31cac8aa891a659e2cf9c5eea1f3fb51')
package(){
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/Epherome/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|/opt/Epherome/${pkgname%-bin} %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}