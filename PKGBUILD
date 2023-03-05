# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=toughcookies-appimage
_pkgname=toughcookies
pkgver=0.45.0
pkgrel=3
epoch=
pkgdesc="Tough Cookies is a modern flash cards study and management app that runs cross-platform on Windows, Mac, and Linux."
arch=("x86_64")
url="https://www.toughcookies.net/"
license=('Freeware')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
optdepends=()
provides=(toughcookies)
conflicts=(toughcookies)
install=
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::https://downloads.toughcookies.net/v0.45.0/Tough-Cookies-0.45.0.AppImage")
sha256sums=('767dcd1fafa142e9178c7fe55f77a6d7f3f995d167bf4a2e0df978af377b59cf')
   
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/toughcookies.AppImage" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}   
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
}
