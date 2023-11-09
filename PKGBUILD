# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=autocut-client
pkgver=0.1.7
pkgrel=3
pkgdesc="Quickly generate video subtitles and edit the video by selecting subtitle clips"
arch=('any')
url="https://github.com/zcf0508/autocut-client"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'electron21'
    'ffmpeg'
)
makedepends=(
    'npm'
    'pnpm'
    'nodejs>=14'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname%-bin}.desktop"
    "${pkgname%-bin}.sh"
)
sha256sums=('8da25341df954439d26b7921736e0539530f1d6b2bc392c826242a68007df990'
            '6189d92e0326fb33813fb8226c68de6fe3e71fb895303cac7d063fddd006c0c4'
            '12f34587289d05e05c95a2a47884f1674faeb96a27d9d66f954f0bb20490c2e5')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    pnpm install
    pnpm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release/v${pkgver}/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/node.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}