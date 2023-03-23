# Maintainer: LeSnake04 <dev.lesnake@posteo.de>
_pkgname=webkitty
pkgname="${_pkgname}-appimage"
pkgver=3.0.0
pkgrel=1
epoch=
pkgdesc="Local web development IDE"
arch=("x86_64")
url="https://dartfling.com/product?pid=3"
_githuburl="https://github.com/yikuansun/webkitty"
license=(MIT)
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
providers=("${_pkgname}")
conflit=("${_pkgname}")
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/WebKitty-${pkgver}.AppImage"
        "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('7d4cc208478c90e3a82945af7c086952a9c64caa9b60abd0407bf8e543ca58e1'
            '38149891459513ff7df2dec243d70c880950572bf1f01a1f3402034406b7d886')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=AppRun/Exec=\/opt\/appimages\/webkitty.AppImage/g;s/Utility/Utility;Development;/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}