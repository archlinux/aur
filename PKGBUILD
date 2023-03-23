# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=xournalpp
pkgname="${_pkgname}-stable-appimage"
_appname="com.github.xournalpp.xournalpp"
pkgver=1.1.3
pkgrel=2
pkgdesc="Handwriting notetaking software with PDF annotation support."
arch=("x86_64")
url="https://xournalpp.github.io/"
_githuburl="https://github.com/xournalpp/xournalpp"
license=('GPL2')
depends=('zlib' 'hicolor-icon-theme' 'glibc')
options=(!strip)
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64.AppImage")
sha256sums=('a0051b3c47cac47d2f58e34ecf24ef639befd7d148301bf3914ea9ad6140fb16')
    
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=/Exec=\/opt\/appimages\/xournalpp.AppImage/g;s/Icon=com.github.xournalpp.xournalpp/Icon=xournalpp/g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/xournalpp.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/${_appname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
}