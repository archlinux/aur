# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=vnote
pkgname="${_pkgname}-appimage"
pkgver=3.16.0
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
source=("${_pkgname}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-linux-x64_v${pkgver}.zip")
sha256sums=('99804e841ca73df2021fe2424612025234ebd768c65e1ca111f3134ae10483a8')
_install_path="/opt/appimages"
   
prepare() {
    mv "${srcdir}/${_pkgname}-linux-x64_v${pkgver}.AppImage" "${srcdir}/${_pkgname}-${pkgver}.AppImage"
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