# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=vnote
pkgname="${_pkgname}-appimage"
pkgver=3.15.1
pkgrel=1
pkgdesc="A pleasant note-taking platform."
arch=('x86_64')
url="https://app.vnote.fun/"
_githuburl="https://github.com/vnotex/vnote"
license=(LGPL3)
options=(!strip)
providers=("${_pkgname}x")
conflits=("${_pkgname}")
depends=(zlib hicolor-icon-theme glibc)
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-linux-x64_v${pkgver}.AppImage")
sha256sums=('d0b2dbf3f43a2ad30361b63f03283e9c2ce8bdb49c2ade02189802584a80a304')
_install_path="/opt/appimages"
   
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=vnote/Exec=\/opt\/appimages\/vnote.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}