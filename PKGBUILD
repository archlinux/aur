# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jasperapp-bin
pkgver=1.1.2
pkgrel=2
pkgdesc="A flexible and powerful issue reader for GitHub"
arch=('x86_64')
url='https://jasperapp.io/'
_githuburl="https://github.com/jasperapp/jasper"
license=('MIT')
depends=('electron18')
makedepends=('gendesk')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%app-bin}_v${pkgver}_linux.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/jasperapp/jasper/master/misc/logo/jasper.iconset/icon_512x512.png"
    "${pkgname%-bin}.sh")
sha256sums=('53f5158ac169cb4462f22fd1a4a4a5e4555cde3aac70d8a1d8b92bc6a5d8f3ca'
            '606dd64bd59eb00a0a34a171483131bc2c10e9bf237ecfc36176cc89e596d3c4'
            'e50160c6141822cfe6c3eff1fc06d15efef5928cac0213d45b2c39972b6d6554')
package() {
    install -Dm644 "${srcdir}/Jasper/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/Jasper/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "Jasperapp" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}