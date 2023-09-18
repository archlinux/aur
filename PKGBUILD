# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=postybirb-plus-bin
pkgver=3.1.29
pkgrel=1
pkgdesc="An application that helps artists post art and other multimedia to multiple websites more quickly."
arch=('x86_64')
url="https://www.postybirb-plus.com/"
_githuburl="https://github.com/mvdicarlo/postybirb-plus"
license=('BSD')
depends=('bash' 'electron13')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${pkgname%-plus-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/mvdicarlo/postybirb-plus/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('47c1771c8ae531e1c3f90319c24c89484c98d64212ca527f9c023a11634ea081'
            'a0b91aa0ffc9564128c6599eac1fc0ba93b8fe477dff6258ef315f0019b5726d'
            'c804138ff3dd61de6904450860278863495cabfd55530501cef226c37b620062')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}