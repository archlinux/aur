# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=houdoku
pkgname="${_pkgname}-appimage"
pkgver=2.12.0
pkgrel=1
pkgdesc="Manga reader and library manager for the desktop"
arch=('x86_64')
url="https://houdoku.org/"
_githuburl="https://github.com/xgi/houdoku"
license=(MIT)
conflicts=("${_pkgname}")
depends=(zlib hicolor-icon-theme glibc)
options=(!strip)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Houdoku-${pkgver}.AppImage"
    "LICENSE::${_githuburl}/raw/master/LICENSE.txt")
sha256sums=('214af183190f3a90455c728f3f034f9dafb78adb33d0d8f8d0cea60b4c7459fb'
            'a5283630540208779679d02f72dc5351ceb60c13f35ef76a6c1065629aa1f7e5')
   
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/houdoku.AppImage/g;' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
   
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}