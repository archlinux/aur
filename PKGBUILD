# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=listen1-desktop-bin
pkgver="2.29.0"
pkgrel=1
pkgdesc="One for all free music in China"
arch=("x86_64")
url="http://listen1.github.io/listen1"
_githuburl="https://github.com/listen1/listen1_desktop"
license=('MIT')
depends=('electron13')
makedepends=('asar' 'gendesk')
conflicts=("${pkgname%-bin}" "${pkgname%-desktop-bin}")
provides=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-desktop-bin}_${pkgver}_linux_x64.tar.gz"
    "LICENSE.md::https://raw.githubusercontent.com/listen1/listen1_desktop/master/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('2144bd12b99916355badd27970d22a084153a45b536766746f32c6b1941013b3'
            'd2aa8a82485042b9d5efb8ed2d9c0e8a66e8983bc3f64ebbe35158d35662cdbc'
            'bd9b80208045429b063c0b45e5485ab467bfe788e93bbd875ebbc815c3c71167')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-desktop-bin}_${pkgver}_linux_x64/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    asar extract "${srcdir}/${pkgname%-desktop-bin}_${pkgver}_linux_x64/resources/app.asar" "${srcdir}/app.asar.unpacked"
    install -Dm644 "${srcdir}/app.asar.unpacked/resources/logo512.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "AudioVideo" --name "Listen1" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}