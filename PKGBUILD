# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=autocut-client
pkgver=0.1.7
pkgrel=2
pkgdesc="Quickly generate video subtitles and edit the video by selecting subtitle clips"
arch=('any')
url="https://github.com/zcf0508/autocut-client"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron21' 'ffmpeg')
makedepends=('pnpm' 'nodejs>=14')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname%-bin}.sh"
    "${pkgname%-bin}.desktop")
sha256sums=('8da25341df954439d26b7921736e0539530f1d6b2bc392c826242a68007df990'
            'b9f2467e91121a3f3f23e94a6731b78a57b723e98ef6a7f66e1734ef69a4098d'
            '6189d92e0326fb33813fb8226c68de6fe3e71fb895303cac7d063fddd006c0c4')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    pnpm install
    pnpm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/v${pkgver}/linux-unpacked/resources/"* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/node.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}