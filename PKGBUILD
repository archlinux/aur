# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yank-note-appimage
_pkgname=yank-note
pkgver=3.50.2
pkgrel=1
pkgdesc="A Hackable Markdown Note Application for Programmers."
arch=('x86_64')
url="https://github.com/purocean/yn"
license=('AGPL3')
provides=("${_pkgname}")
options=(!strip)
conflicts=('yank-note-bin')
depends=(hicolor-icon-theme zlib)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Yank-Note-linux-x86_64-${pkgver}.AppImage")
sha512sums=('3ceb4796d9ef6d238ad6f356cae6f4fa9b9834e3f625dfaa680efc88f01473507d0f0b39f90624c8a40f368b5ea1f31b4b1071c08a3ea21867a9c4127abc43e4')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g;s/Icon=/\#Icon=e/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/${_pkgname}.AppImage" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Categories=Development;" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
}
