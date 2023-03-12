# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flawesome-appimage
_pkgname=flawesome
pkgver=0.2.3
pkgrel=4
epoch=
pkgdesc="Flawesome is a modern productivity tool that will help you organise your day-today work and thoughts."
arch=("x86_64")
url="https://github.com/ashishBharadwaj/flawesome"
license=('GPL3')
depends=(hicolor-icon-theme zlib)
options=(!strip)
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install=
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Flawesome-${pkgver}.AppImage")
sha256sums=('c673740a1399440fd17c75c35ab5873281e552bee2313e06d16eccdc98e7fe46')   
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g;s/Categories=Productivity;/Categories=Utility;/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/${_pkgname}.AppImage" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
   
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
}