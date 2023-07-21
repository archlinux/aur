# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=space-snake-bin
pkgver=0.11.1
pkgrel=2
pkgdesc="A Desktop game built with Electron and Vue.js."
arch=('x86_64')
url="https://github.com/ilyagru/Space-Snake"
license=('MIT')
depends=('bash' 'electron4')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/Space-Snake-linux-x64-v${pkgver}.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/ilyagru/Space-Snake/master/app/icons/icon.png"
    "${pkgname%-bin}.sh")
sha256sums=('b4ed62ff9b5dc3cc815f0ac5328dc602ce29f6bb3231beab622c246c7c2554f9'
            '2cf69008e16f9f81098eaed1b59e481bafb258606cc9171047db9b6fdec6cb9f'
            'db3df84cc0eb96fd548c4a0d507992883fdf4a0e7e449412caf5a37552e63eb1')
package() {
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/Space-Snake-linux-x64-v${pkgver}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/Space-Snake-linux-x64-v${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Game" --name "Space-Snake" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}