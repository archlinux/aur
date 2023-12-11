# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=less-player-bin
_appname="Less Player"
pkgver=0.1.19
_electronversion=22
pkgrel=1
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
sha256sums=('86ff76a1d6b986fdf63b00616e346c02c4752f19690d9fde8ddae120a705ef33'
            'fb0c18a25174bf87a2fd5b445b8c2b78a0a90e1cc040b7f0b289e08e05c882af'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "AudioVideo" --name "${_appname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.asar" "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}