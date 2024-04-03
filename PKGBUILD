# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=goinload-bin
_pkgname=GoinLoad
pkgver=0.1.0
pkgrel=1
pkgdesc="A cross-platform desktop app that lets you scrape and bulk download images from a cyberdrop gallery."
arch=("x86_64")
url="https://goinload.netlify.app/"
_ghurl="https://github.com/Vincemoc/GoinLoad"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Vincemoc/GoinLoad/v${pkgver}/LICENSE"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/Vincemoc/GoinLoad/v${pkgver}/site/img/logo.png"
)
sha256sums=('519574f99932c58970efebcd99e4ac5a57711a0606758a41484fff94a3d804fa'
            'c274cf880ad53fec383ae410e1be7089cdf9b68c403733927d1e6bf2f9e07091'
            '03e9b439a85161e6677fe0a7f4e80d1761963c60562ca64bfc9d8aaa107ed0d2')
build() {
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}