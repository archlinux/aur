# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="eudic-appimage"
pkgver=13.2.7
pkgrel=1
pkgdesc="权威的英语词典软件,英语学习者必备的工具,支持学习笔记、生词本多平台同步,让你随时随地学英语."
arch=('x86_64')
url="https://www.eudic.net/v4/en/app/eudic"
license=('custom')
options=(!strip)
conflicts=("${pkgname%-appimage}")
provides=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
options=(!strip)
source=("${pkgname%-appimage}-${pkgver}.AppImage::https://static-main.frdic.com/pkg/${pkgname%-appimage}.AppImage?v=2023-06-06"
    "LICENSE.html")
sha256sums=('feb5c16a657533f2a28e34d2ac971b17c9cc4e56f6bf2e46a3e20a8da4c11db2'
            '08681fd71b5fef70aa1f672f962f8e72aee935a7224d57e16e8ad2b03c69e7f3')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|/usr/share/${pkgname%-appimage}/AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|ecom.eusoft.${pkgname%-appimage}|${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/default.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/com.eusoft.${pkgname%-appimage}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}