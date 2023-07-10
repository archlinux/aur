# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="colorpicker-app-bin"
pkgver=2.2.0
pkgrel=1
pkgdesc="A mininal but complete colorpicker desktop app"
arch=('x86_64')
url="https://colorpicker.fr/"
_githuburl="https://github.com/Toinane/colorpicker"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-app-bin}" "${pkgname%-app-bin}-fr")
provides=("${pkgname%-bin}")
depends=('electron19')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/Colorpicker-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('791495d718a2245294bda7ed431353a8b3f24d8f6b586fed104783aa85fe58a2'
            '13c994f2ce85dff55b214f8f1b5d1411fc00702eae394f2e558189c963d11385')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmapsdd"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}