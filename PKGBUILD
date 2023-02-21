# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xournalpp-stable-appimage
_pkgname=xournalpp
pkgver=1.1.3
pkgrel=1
epoch=
pkgdesc="Handwriting notetaking software with PDF annotation support."
arch=("x86_64")
url="https://xournalpp.github.io/"
_githuburl="https://github.com/xournalpp/xournalpp"
license=('GPL2')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
optdepends=()
provides=(xournalpp)
conflicts=('xournalpp' 'xournalpp-git' 'xournalpp-micro' 'xournalpp-mobile-git')
install=
_install_path="/opt/appimages"
source=(
    "${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64.AppImage"
    )
sha256sums=('a0051b3c47cac47d2f58e34ecf24ef639befd7d148301bf3914ea9ad6140fb16')
    
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g;' -i "${srcdir}/squashfs-root/com.github.xournalpp.xournalpp.desktop"
    echo "Exec=/opt/appimages/xournalpp.AppImage" >> "${srcdir}/squashfs-root/com.github.xournalpp.xournalpp.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/com.github.xournalpp.xournalpp.desktop" "${pkgdir}/usr/share/applications/xournalpp.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/com.github.xournalpp.xournalpp.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/com.github.xournalpp.xournalpp.svg"
}
