# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jasperapp-bin
_pkgname=Jasper
pkgver=1.1.2
_electronversion=18
pkgrel=6
pkgdesc="A flexible and powerful issue reader for GitHub"
arch=('x86_64')
url='https://jasperapp.io/'
_ghurl="https://github.com/jasperapp/jasper"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron18'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%app-bin}_v${pkgver}_linux.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/jasperapp/jasper/v${pkgver}/misc/logo/jasper.iconset/icon_512x512.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('53f5158ac169cb4462f22fd1a4a4a5e4555cde3aac70d8a1d8b92bc6a5d8f3ca'
            '606dd64bd59eb00a0a34a171483131bc2c10e9bf237ecfc36176cc89e596d3c4'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}