# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=selvania-launcher-bin
_pkgname=Selvania-Launcher
pkgver=1.3.5
pkgrel=1
pkgdesc="Custom launcher for modded minecraft written in electron.js and Node.js"
arch=("x86_64")
url="http://luuxis.fr/"
_ghurl="https://github.com/luuxis/Selvania-Launcher"
license=("custom")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron26'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/${pkgver}/${_pkgname}-linux-x64.tar.gz"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/luuxis/Selvania-Launcher/${pkgver}/src/assets/images/icon.png"
    "LICENSE.md::https://raw.githubusercontent.com/luuxis/Selvania-Launcher/${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('60c5993b370060a937b555473755b44367a1c247bc7989624626d63adf55b60f'
            '8b6d0dde9d975f1f9fe7c8307066a6e0d06ba316ee1ef239359ead9d007316ab'
            '7c73b8f626696c0403394da3dae0d5ed33009cc2d674803d40bc4e2c7e67174b'
            'b51b14b64fded648a1a45c70ef6d2512cf6697b1c81b76cfba947eb1148d6f23')
build() {
    gendesk -q -f -n --categories "Game" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname//-/ }-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}