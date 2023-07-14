# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=graycrown-bin
pkgver=1.2.1
pkgrel=2
pkgdesc="A simple game launcher for games.Old Coal. Now revived with a new name!"
arch=('x86_64')
url="https://zeankundev.github.io/graycrown"
_githuburl="https://github.com/zeankundev/graycrown"
license=('GPL3')
conflits=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('electron20' 'bash')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('8b752cf3803eceb1bdd8f09ab3f8c49801e3f169d0720b67ef0b5be628960c1a'
            'bed52487787e70e73242f6312e2f74b6ae147c585e9f26cb1db86a7d35f307f0')
  
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm755 "${srcdir}//opt/Graycrown/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|\"/opt/Graycrown/graycrown\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}