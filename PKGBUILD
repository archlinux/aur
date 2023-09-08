# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=space-snake-bin
_pkgname=Space-Snake
pkgver=0.11.1
pkgrel=3
pkgdesc="A Desktop game built with Electron and Vue.js."
arch=('x86_64')
url="https://github.com/ilyagru/Space-Snake"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron4')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_pkgname}-linux-x64-v${pkgver}.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/ilyagru/Space-Snake/${pkgver}/app/icons/icon.png"
    "${pkgname%-bin}.sh")
sha256sums=('b4ed62ff9b5dc3cc815f0ac5328dc602ce29f6bb3231beab622c246c7c2554f9'
            '2cf69008e16f9f81098eaed1b59e481bafb258606cc9171047db9b6fdec6cb9f'
            'db3df84cc0eb96fd548c4a0d507992883fdf4a0e7e449412caf5a37552e63eb1')
prepare() {
    gendesk -f -n --categories "Game" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64-v${pkgver}/resources/"*.asar -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64-v${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}