# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=imagine-appimage
_pkgname=imagine
pkgver=0.7.3
pkgrel=2
pkgdesc="PNG/JPEG optimization app"
arch=("x86_64")
url="https://github.com/meowtec/Imagine"
license=(MIT)
depends=(hicolor-icon-theme zlib)
options=(!strip)
provides=(meowtec)
conflicts=(imagine-git)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Imagine-${pkgver}.AppImage")
sha256sums=('01f76a3d0863a675b837fe572dfd022547e5c30aac22af118354a6c3d3ff4578')
        
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage" > /dev/null
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/AppRun/\/opt\/appimages\/imagine.AppImage /g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
        
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
}