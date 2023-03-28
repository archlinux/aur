# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=koodo-reader
pkgname="${_pkgname}-appimage"
pkgver=1.5.3
pkgrel=1
pkgdesc="A modern ebook manager and reader with sync and backup capacities"
arch=("x86_64")
url="https://github.com/troyeguo/koodo-reader"
license=(AGPL3)
depends=(zlib hicolor-icon-theme glibc)
options=(!strip)
provides=(troyeguo)
conflicts=("${_pkgname}")
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Koodo-Reader-${pkgver}-x86_64.AppImage")
sha256sums=('07270fc1c1e0ef4658883a8a078a8b5979ec094b9f0a091907e8f12a096781d9')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/koodo-reader.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}   
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/${_pkgname}.xml" "${pkgdir}/usr/share/mime/${_pkgname}.xml"
}