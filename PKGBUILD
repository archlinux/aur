# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pikatorrent-bin
_pkgname=PikaTorrent
pkgver=0.8.3
pkgrel=2
pkgdesc="A modern, open source and electric BitTorrent app for mobile, desktop & server."
arch=('x86_64')
url="https://www.pikatorrent.com/"
_ghurl="https://github.com/G-Ray/pikatorrent"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron26'
)
makedepends=(
    'gendesk'
)
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64-${pkgver}.zip"
    "${pkgname%-bin}.sh")
sha256sums=('b0e411c9c5404790bd6282d03e24af91f0931447ac1ccd7975e4ff58ef9ff931'
            '27aa271abe161643dee1e88c822ffc6ccb251d4efcf97719ead2e06175f65698')
build() {
    asar pack "${srcdir}/${pkgname%-bin}-linux-x64/resources/app" "${srcdir}/app.asar"
    gendesk -q -f -n --categories "Network;Utility" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}