# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=less-player-bin
_appname="Less Player"
pkgver=0.1.17_dev_3
pkgrel=1
pkgdesc="Less is More~ All for One, One for All ! Less Player, 一款基于Electron + Vue3开发的播放器 !"
arch=('x86_64')
url="https://github.com/GeekLee2012/Less-Player-Desktop"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron22')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.asar::${url}/releases/download/v${pkgver//_/-}/app.asar"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/GeekLee2012/Less-Player-Desktop/v${pkgver//_/-}/public/icon%402x.png"
    "${pkgname%-bin}.sh")
sha256sums=('31c338ad62e83de5508888d67b412ef21ec319e40ac48b0cf5213c740c7a83b4'
            'fb0c18a25174bf87a2fd5b445b8c2b78a0a90e1cc040b7f0b289e08e05c882af'
            'a293fca66dd1070ebf4a809ced2caad24816edc9ed76ad5f567f531edcb869ab')
build() {
    gendesk -q -f -n --categories "AudioVideo" --name "${_appname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.asar" "${pkgdir}/opt/${pkgname%-bin}/resources/app.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}