# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nuclear-player-appimage
_pkgname=nuclear
pkgver=fd06a3
pkgrel=1
epoch=
pkgdesc="Streaming music player that finds free music for you"
arch=("x86_64")
url="https://nuclear.js.org/"
_githuburl="https://github.com/nukeop/nuclear"
license=(AGPL3)
depends=(hicolor-icon-theme zlib)
options=(!strip)
optdepends=()
provides=()
conflicts=(nuclear-player-bin)
install=
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/nuclear-${pkgver}.AppImage")
sha256sums=('0331ff121837afa948368bbeb458a6e0abc7346bd3d7cd997a97607d854fb056')
        
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=AppRun/#Exec=AppRun/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/nuclear.AppImage" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
        
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
}
