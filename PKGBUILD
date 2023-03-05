# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yana-appimage
_pkgname=yana
pkgver=1.0.13
pkgrel=2
epoch=
pkgdesc="Powerful note-taking app with nested documents, full-text search, rich-text editor, code snippet editor and more"
arch=("x86_64")
url="https://yana.js.org/"
_githuburl="https://github.com/lukasbach/yana"
license=(MIT)
depends=(hicolor-icon-theme zlib)
options=(!strip)
optdepends=()
provides=()
conflicts=(yana-bin)
install=
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Yana-${pkgver}.AppImage")
sha256sums=('f8377ecede1247c44742e76ef9f2cbae1050e9390970a9b40dd512542347cfb2')
      
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=AppRun/#Exec=AppRun/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/yana.AppImage" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for i in 16x16 32x32 48x48 64x64 128x128 256x256 512x512; do
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png"
    done
}