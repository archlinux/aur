# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mediachips-appimage
_pkgname=mediachips
pkgver=0.11.3
pkgrel=1
epoch=
pkgdesc="Manage your videos, add any metadata to them and play them."
arch=("x86_64")
url="https://mediachips.app/"
_githuburl="https://github.com/fupdec/mediaChips"
license=(GPL3)
depends=(hicolor-icon-theme zlib)
options=(!strip)
optdepends=()
provides=()
conflicts=()
install=
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}-beta/MediaChips.v${pkgver}.Linux.AppImage")
sha256sums=('8af9d3e09bc812826e8c67908b2bfb7b6c638d70946cf45ae696f26b2e276610')
     
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=AppRun/Exec=\/opt\/appimages\/mediachips.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for i in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png"
    done
}