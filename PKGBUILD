# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="colorpicker-appimage"
pkgver=2.2.0
pkgrel=1
pkgdesc="A mininal but complete colorpicker desktop app"
arch=('x86_64')
url="https://colorpicker.fr/"
_githuburl="https://github.com/Toinane/colorpicker"
license=('GPL3')
options=(!strip)
conflicts=("${pkgname%-appimage}" "electronmail" "electronmail-bin")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/Colorpicker-${pkgver}.AppImage")
sha256sums=('791495d718a2245294bda7ed431353a8b3f24d8f6b586fed104783aa85fe58a2')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/colorpicker.AppImage|g;s|colorpicker-app|colorpicker|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}-app.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-appimage}-app.png" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}-app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}
