# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-netease-cloud-music-bin
pkgver=0.9.38
_electronversion=25
pkgrel=5
pkgdesc="UNOFFICIAL client for music.163.com . Powered by Electron, Vue, and Muse-UI."
arch=('x86_64')
url="https://dl.encm.cf/"
_ghurl="https://github.com/Rocket1184/electron-netease-cloud-music"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.asar::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}.asar"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/Rocket1184/electron-netease-cloud-music/v${pkgver}/assets/icons/icon.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('9171b1858e8d5b4faef7c0be1cf786c3b824dec5ffe2a4014b1c8239e63cabcc'
            'af1edb0435906e7603db02b8622876fb462cbd1135d54c2d74a9c54b4f1c131d'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "AudioVideo" --name "${pkgname%-bin}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.asar" "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}