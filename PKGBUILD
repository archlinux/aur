# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-netease-cloud-music-bin
pkgver=0.9.38
pkgrel=4
pkgdesc="UNOFFICIAL client for music.163.com . Powered by Electron, Vue, and Muse-UI."
arch=('x86_64')
url="https://dl.encm.cf/"
_githuburl="https://github.com/Rocket1184/electron-netease-cloud-music"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron25'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.asar::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}.asar"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/Rocket1184/electron-netease-cloud-music/v${pkgver}/assets/icons/icon.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('9171b1858e8d5b4faef7c0be1cf786c3b824dec5ffe2a4014b1c8239e63cabcc'
            'af1edb0435906e7603db02b8622876fb462cbd1135d54c2d74a9c54b4f1c131d'
            'f237e28334986f22e10bf5fcbf4990b01c763b16c6c81506c6f7481da6c872af')
build() {
    gendesk -q -f -n --categories "AudioVideo" --name "${pkgname%-bin}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.asar" "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}