# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=postybirb-plus-bin
pkgver=3.1.26
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
    "LICENSE::https://raw.githubusercontent.com/mvdicarlo/postybirb-plus/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('71dfcda5a259a694180bb3fc20234ec10464d086b4ae28fd4e6d8d091ece0877'
            'a0b91aa0ffc9564128c6599eac1fc0ba93b8fe477dff6258ef315f0019b5726d'
            '765c2106b8f66033ea179addd069d47e0f4cb3d67019ae3c6a218a769ac5763d')
prepare() {
  chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
  "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}