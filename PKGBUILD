# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=threema-for-desktop-bin
_pkgname=Threema-For-Desktop
_appname=threema-desktop
pkgver=2.5.1
pkgrel=1
pkgdesc="Unofficial desktop client for Threema"
arch=('x86_64')
url="https://github.com/GeekCornerGH/threema-for-desktop"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron21')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-linux-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/GeekCornerGH/threema-for-desktop/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('8954d9b28bdc3b3c9caa115b3a15be79279366d8afb087b8a5e9577ec8bf6066'
            '92f52afa40f9343b922a111f5e79cfcb864e77e334b92d63b0a6c8bd9c45d94d'
            '364d24402186b57940d44f142658d3932d4549ef4a083c42ff2f89077684e7a4')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g;s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}