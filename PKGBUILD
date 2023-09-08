# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=postybirb-bin
_pkgname=PostyBirb
pkgver=2.3.44
pkgrel=2
pkgdesc="An application that helps artists post art and other multimedia to multiple websites more quickly."
arch=('x86_64')
url="https://www.postybirb.com/"
_githuburl="https://github.com/mvdicarlo/postybirb"
license=('BSD')
depends=('bash' 'electron13')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-plus")
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE.md::https://raw.githubusercontent.com/mvdicarlo/postybirb/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('45dc119851f148344b3601f5a00de67e00d2575f9dd616bcbd82d4eeda97b49d'
            '12e65eb62d705f4cf38eb2f7b382206fb3155fbdbff559f87c702a5e1c1c2207'
            '775e68d3761226d5efce6b525b1a2cce1d492e77ef31aa9721b9181489274712')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}