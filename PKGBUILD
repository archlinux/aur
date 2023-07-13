# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="ferrum-bin"
pkgver=0.16.12
pkgrel=2
pkgdesc="Music library app for Mac, Linux and Windows"
arch=('x86_64')
url="https://github.com/probablykasper/ferrum"
license=('custom')
conflicts=("${pkgname%-bin}")
depends=('electron19' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Ferrum-v${pkgver}-linux.deb"
    "${pkgname%-bin}.sh")
sha256sums=('9698d0088bfdfb702e53fcb5d95aa5ad3668f14b978fb4e247443beee8c2efc9'
            '71aefe1c77400e66d3d51101bdd2621f1ed602c9014ca8fa4fe4d56cfcdc4dcf')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/Ferrum/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|/opt/Ferrum/ferrum %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Audio|AudioVideo|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/Ferrum/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}