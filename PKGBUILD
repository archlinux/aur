# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=listen1-desktop-bin
pkgver=2.31.0
pkgrel=3
pkgdesc="One for all free music in China"
arch=("x86_64")
url="http://listen1.github.io/listen1"
_githuburl="https://github.com/listen1/listen1_desktop"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-desktop-bin}")
depends=('bash' 'electron13')
makedepends=('asar' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-desktop-bin}_${pkgver}_linux_x64.tar.gz"
    "LICENSE.md::https://raw.githubusercontent.com/listen1/listen1_desktop/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('9ce7d408812b7532d8bff8f2f41c1d226cecb618cbca7e5a37d2d5c780f337c2'
            'd2aa8a82485042b9d5efb8ed2d9c0e8a66e8983bc3f64ebbe35158d35662cdbc'
            '5d1b5c05a863bf337e69e874e4f18fb42330b1d42aaece12ac2fd87705b59914')
prepare() {
    asar extract "${srcdir}/${pkgname%-desktop-bin}_${pkgver}_linux_x64/resources/app.asar" "${srcdir}/app.asar.unpacked"
    gendesk -f -n --categories "AudioVideo" --name "Listen1" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-desktop-bin}_${pkgver}_linux_x64/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/resources/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/app.asar.unpacked/resources/logo512.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}