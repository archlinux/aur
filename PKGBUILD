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
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/luuxis/Selvania-Launcher/master/src/assets/images/icon.png"
    "LICENSE::https://raw.githubusercontent.com/luuxis/Selvania-Launcher/master/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('f96c89541d07113d3dd071783e704f445e3841906e3a9ebbec16984fc85394e5'
            '8b6d0dde9d975f1f9fe7c8307066a6e0d06ba316ee1ef239359ead9d007316ab'
            '7c73b8f626696c0403394da3dae0d5ed33009cc2d674803d40bc4e2c7e67174b'
            '98674e99c34736bfdd74affe611c813b08f69674e2240cd894c3dfb567ea574f')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname//-/ }-linux-x64/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --categories "Game" --name "${_pkgname}" --exec "${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}