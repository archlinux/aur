# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="mater-bin"
pkgver=1.0.10
pkgrel=2
pkgdesc="A simple menubar Pomodoro app"
arch=('x86_64')
url="https://github.com/jasonlong/mater"
license=('MIT')
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron11')
makedepends=('asar' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/Mater-linux-x64.zip"
    "${pkgname%-bin}.sh")
sha256sums=('b26d8ef79fd92c95ac914e73af9504f06dcfaa204f62c47cc3d423a53fa32f8a'
            '9bfca3605b76273dec4360e9cf3c4fc0616a4e2804b119e44fb0a2d2c3ef02c9')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/Mater-linux-x64/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/Mater-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/Mater-linux-x64/resources/app/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "Mater" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}