# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=netpad-appimage
_pkgname=netpad
pkgver=0.1.0
pkgrel=1
pkgdesc="A cross-platform C# editor and playground."
arch=('x86_64')
url="https://github.com/tareqimbasher/NetPad"
license=('MIT')
options=(!strip)
providers="tareqimbasher"
conflits=(netpad)
depends=(zlib hicolor-icon-theme)
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/netpad-${pkgver}-x86_64.AppImage")
sha256sums=('58fc52ddabd426918f49eb36e930805d5dabb510d0d5dacc8c35bb4fca9906c0')
_install_path="/opt/appimages" 
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/netpad.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}   
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 32x32 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
