# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=openscad-appimage
_pkgname=openscad
pkgver=2021.01
pkgrel=1
epoch=
pkgdesc="The programmers solid 3D CAD modeller"
arch=("x86_64")
url="http://openscad.org"
_githuburl="https://github.com/lukasbach/openscad"
license=(GPL2)
depends=(hicolor-icon-theme zlib)
options=(!strip)
optdepends=()
provides=(openscad)
conflicts=(openscad)
install=
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::https://files.openscad.org/OpenSCAD-${pkgver}-x86_64.AppImage")
sha256sums=('f758528f2cd213f773c7a105fb63bf3b45bf754b0f586fbb7c9cd653ffcd0882')
       
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=openscad/#Exec=openscad/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/openscad.AppImage" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
       
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for i in  48x48 64x64 128x128 256x256 512x512; do
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png"
    done
}
