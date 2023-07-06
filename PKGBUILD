# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aniflix-bin
pkgver=0.0.1
pkgrel=2
pkgdesc="Anime Streaming Desktop App"
arch=('x86_64')
url="https://aniflix.lamaau.space/"
_githuburl="https://github.com/rizkhal/aniflix"
license=('MIT')
depends=('electron')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_0.1.0_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/rizkhal/aniflix/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('db3c22d7f9d359852125fd5f3dc570fe540d3e10b2a172472cbf0c9df2b986da'
            'da16a40b186b34bc8ef2c4e442a3da9dc2b88893d144695943412d18d59a1b4f'
            '6d4851336e2d806120624afdf312fee9021456aa35209926be300eec51d9da65')
 
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm644 "${srcdir}/opt/aniflix/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}