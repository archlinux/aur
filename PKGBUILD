# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-netease-cloud-music-bin
pkgver=0.9.38
pkgrel=3
pkgdesc="UNOFFICIAL client for music.163.com . Powered by Electron, Vue, and Muse-UI."
arch=('x86_64')
url="https://dl.encm.cf/"
_githuburl="https://github.com/Rocket1184/electron-netease-cloud-music"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.asar::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}.asar"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/Rocket1184/electron-netease-cloud-music/v${pkgver}/assets/icons/icon.png"
    "${pkgname%-bin}.sh")
sha256sums=('9171b1858e8d5b4faef7c0be1cf786c3b824dec5ffe2a4014b1c8239e63cabcc'
            'af1edb0435906e7603db02b8622876fb462cbd1135d54c2d74a9c54b4f1c131d'
            '85588e6eaebd384788bb51e07b10bd222ed45feb755ee15d00fc62ecc8813692')
prepare() {
    gendesk -f -n --categories "AudioVideo" --name "${pkgname%-bin}" --exec "${pkgname%-bin} %U"
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}