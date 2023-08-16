# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=notekit-appimage
_appname="com.github.blackhole89.${pkgname%-appimage}"
pkgver=0.2.0
pkgrel=3
pkgdesc="A GTK3 hierarchical markdown notetaking application with tablet support."
arch=('x86_64')
url="https://github.com/blackhole89/notekit"
license=('GPL3')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}+git1.73c1a86-Build6.1.glibc2.14-${CARCH}.AppImage")
sha256sums=('bf17231318c8017a90d1df84ccc9675235fddc2cc0616b4a7151766f5b0c7ae3')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/128x128/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    sed "s|Exec=${pkgname%-appimage}|Exec=${_install_path}/${pkgname%-appimage}.AppImage|g;s|${_appname}|${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}