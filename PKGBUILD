# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=godoos-bin
_pkgname=GodoOS
pkgver=1.0.0
pkgrel=1
pkgdesc="An efficient intranet office platform that includes various tools such as Word, Excel, PPT, PDF, intranet chat, whiteboard, and mind mapping, and supports native file storage."
arch=("x86_64")
url="http://gdoa.top/"
_ghurl="https://github.com/phpk/godoos"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/phpk/godoos/v${pkgver}/LICENSE"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/phpk/godoos/v${pkgver}/build/appicon.png"
)
sha256sums=('07a677f050aa58c508dad4f4c1e93a7de5363b33d9cc257246a175927ad44a5d'
            '4c670b4fb2803c2779132e9e5b9f16d9cd2117b56c1dc5351b894c542b494260'
            'd912088bdd9962fbb250af6c8f2aa08f9bf5a8cb8fbde34c4fb1e0505d3fb634')
build() {
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility;Office" --name="${_pkgname}" --exec="${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}