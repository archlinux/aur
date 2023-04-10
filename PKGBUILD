# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="xplist-appimage"
pkgver=1.2.47
pkgrel=2
pkgdesc="Cross-platform Plist Editor"
arch=("x86_64")
url="https://github.com/ic005k/Xplist"
license=(MIT)
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
conflit=("${pkgname%-appimage}")
providers=("ic005k")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/Xplist-Linux-x86_64.AppImage"
        "LICENSE::${url}/raw/main/LICENSE")
sha256sums=('9319fd1f4ccda8abe34ab18390f3cd81d69c442c5030f7583e59c8bc4c1395eb'
            'bd3712bc99be8022441e1b3f3d473848abef0b814ae1cb1b2d65abbe3ed6a71f')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=Xplist|Exec=/opt/appimages/xplist.AppImage|g;s|Icon=icon|Icon=xplist|g;s|Categories=Application|Categories=Utility|g' \
        -i "${srcdir}/squashfs-root/default.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}