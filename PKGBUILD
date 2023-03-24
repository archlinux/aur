# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=yank-note
pkgname="${_pkgname}-appimage"
pkgver=3.50.2
pkgrel=2
pkgdesc="A Hackable Markdown Note Application for Programmers."
arch=('x86_64')
url="https://demo.yank-note.com/"
_githuburl="https://github.com/purocean/yn"
license=('AGPL3')
provides=("${_pkgname}")
options=(!strip)
conflicts=("${_pkgname}-bin")
depends=(hicolor-icon-theme zlib glibc)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Yank-Note-linux-x86_64-${pkgver}.AppImage")
sha256sums=('43f4a92b3e749249a9f138a7d2bf3188c4dad3ddc7d200140530e3b1229e67c1')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=/Exec=\/opt\/appimages\/yank-note.AppImage/g;s/Categories=Markdown/Categories=Development/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
}