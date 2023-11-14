# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jasperapp-bin
_pkgname=Jasper
pkgver=1.1.2
pkgrel=6
pkgdesc="A flexible and powerful issue reader for GitHub"
arch=('x86_64')
url='https://jasperapp.io/'
_githuburl="https://github.com/jasperapp/jasper"
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
    "${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${pkgname%app-bin}_v${pkgver}_linux.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/jasperapp/jasper/v${pkgver}/misc/logo/jasper.iconset/icon_512x512.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('53f5158ac169cb4462f22fd1a4a4a5e4555cde3aac70d8a1d8b92bc6a5d8f3ca'
            '606dd64bd59eb00a0a34a171483131bc2c10e9bf237ecfc36176cc89e596d3c4'
            'd588a67beb914c1d355491e31679b9f19a1f18348a7248ace60139ffe98bb0a2')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}