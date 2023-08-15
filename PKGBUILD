# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=listen1-desktop-bin
pkgver=2.31.0
pkgrel=2
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
    "LICENSE.md::https://raw.githubusercontent.com/listen1/listen1_desktop/master/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('9ce7d408812b7532d8bff8f2f41c1d226cecb618cbca7e5a37d2d5c780f337c2'
            'd2aa8a82485042b9d5efb8ed2d9c0e8a66e8983bc3f64ebbe35158d35662cdbc'
            '69cd307012d2f4bf64a4f7792b0df4af38666a7ef66046d1ef791e6b46c01e6f')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-desktop-bin}_${pkgver}_linux_x64/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    asar extract "${srcdir}/${pkgname%-desktop-bin}_${pkgver}_linux_x64/resources/app.asar" "${srcdir}/app.asar.unpacked"
    install -Dm644 "${srcdir}/app.asar.unpacked/resources/logo512.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "AudioVideo" --name "Listen1" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}