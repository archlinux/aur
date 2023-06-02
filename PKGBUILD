# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="interastral-peace-chat-appimage"
_appname="ipc"
pkgver=1.0.0
pkgrel=1
pkgdesc="Interastral Peace Chat (HSR messaging app)"
arch=('x86_64')
url="https://github.com/niizam/ipc"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}" "${_appname}" "${_appname}-appimage")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Interastral.Peace.Chat-linux-x64-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/niizam/ipc/main/LICENSE")
sha256sums=('4e190977093c308f8122a716e005814d72b28a832dce341c1026f52c6ec370f5'
            '4a0102513b658872c91f6e2a2d8244aaaab86c8686bc572c169b386d511c6975')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|${_appname}|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}