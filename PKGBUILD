# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=selvania-launcher-bin
_pkgname=Selvania-Launcher
pkgver=1.3.3
pkgrel=1
pkgdesc="Custom launcher for modded minecraft written in electron.js and Node.js"
arch=("x86_64")
url="http://luuxis.fr/"
_githuburl="https://github.com/luuxis/Selvania-Launcher"
license=("custom")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron26')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/${pkgver}/${_pkgname}-linux-x64.tar.gz"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/luuxis/Selvania-Launcher/${pkgver}/src/assets/images/icon.png"
    "LICENSE.md::https://raw.githubusercontent.com/luuxis/Selvania-Launcher/${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('f96c89541d07113d3dd071783e704f445e3841906e3a9ebbec16984fc85394e5'
            '8b6d0dde9d975f1f9fe7c8307066a6e0d06ba316ee1ef239359ead9d007316ab'
            '7c73b8f626696c0403394da3dae0d5ed33009cc2d674803d40bc4e2c7e67174b'
            '76b58ce7096276126c731cb758cf5a71bb77829cfec8fd912a8b31908ca66ad6')
build() {
    gendesk -q -f -n --categories "Game" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname//-/ }-linux-x64/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}