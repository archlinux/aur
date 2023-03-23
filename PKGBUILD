# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=p3x-onenote
pkgname="${_pkgname}-appimage"
pkgver=2023.4.117
pkgrel=2
epoch=
pkgdesc="Linux Electron Onenote - A Linux compatible version of OneNote"
arch=("x86_64")
url="https://www.corifeus.com/onenote/"
_githuburl="https://github.com/patrikx3/onenote"
license=(MIT)
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
optdepends=()
provides=(patrikx3)
conflicts=("${_pkgname}")
_install_path="/opt/appimages"
source=(
    "${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/P3X-OneNote-${pkgver}.AppImage"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('86bfe63ceae588ff037a3dc3544dbec1891bd49efcf560a4918df17bd11c338e'
            '675c61a66958b9e72afb1bbd2b13111ceec5c516f528d29b5c6a3a9337a45aa4')
    
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=AppRun/Exec=\/opt\/appimages\/p3x-onenote.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for _icons in 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
