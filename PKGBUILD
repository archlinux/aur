# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=less-player-bin
_appname="Less Player"
pkgver=0.1.20
_electronversion=22
pkgrel=2
pkgdesc="Less is More~ All for One, One for All ! Less Player, 基于Electron + Vue3开发、插件化的播放器"
arch=('x86_64')
url="https://github.com/GeekLee2012/Less-Player-Desktop"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.asar::${url}/releases/download/v${pkgver}/app.asar"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/GeekLee2012/Less-Player-Desktop/v${pkgver}/public/icon%402x.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('bec09b6d1dfbe71ae8c42f90589aafda5e73379ad121834c0a6ae92c90d75d92'
            'fb0c18a25174bf87a2fd5b445b8c2b78a0a90e1cc040b7f0b289e08e05c882af'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "AudioVideo" --name "${_appname}" --exec "${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.asar" "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}