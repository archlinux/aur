# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jasperapp-bin
_appname=Jasper
pkgver=1.1.2
pkgrel=4
pkgdesc="A flexible and powerful issue reader for GitHub"
arch=('x86_64')
url='https://jasperapp.io/'
_githuburl="https://github.com/jasperapp/jasper"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron18')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%app-bin}_v${pkgver}_linux.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/jasperapp/jasper/master/misc/logo/jasper.iconset/icon_512x512.png"
    "${pkgname%-bin}.sh")
sha256sums=('53f5158ac169cb4462f22fd1a4a4a5e4555cde3aac70d8a1d8b92bc6a5d8f3ca'
            '606dd64bd59eb00a0a34a171483131bc2c10e9bf237ecfc36176cc89e596d3c4'
            '684cdf4c4930366d049bbb0ae56a68a53dd4596d96c5faee5a9d4eb41138d2dc')
package() {
    install -Dm644 "${srcdir}/${_appname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${_appname}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}