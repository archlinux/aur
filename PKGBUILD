# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pandora-box-bin
_pkgname=Pandora-Box
pkgver=0.2.29
pkgrel=1
pkgdesc="A Simple Mihomo GUI.(Written in Go,prebuilt version)"
arch=('x86_64')
url="https://github.com/snakem982/Pandora-Box"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'mihomo'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/linux-amd64.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/snakem982/Pandora-Box/v${pkgver}/frontend/src/assets/images/appicon.png"
)
sha256sums=('d2ce6611c893f661738adc181d0c683319faf21cf83c2fb2a043e2e4895b5eaa'
            '5aa6d3df181607243064ceb3cdb12b59a23e48ca91266323a4d0105484d1c707')
prepare() {
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${pkgname%-bin}" \
        --exec="${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-amd64" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}