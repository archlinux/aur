# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bilibili-videodownloader-appimage
_pkgname=bilibilivideodownload
pkgver=3.3.3
pkgrel=1
pkgdesc="Cross-platform download bilibili video desktop software, support windows, macOS, Linux"
arch=('x86_64')
url="https://github.com/BilibiliVideoDownload/BilibiliVideoDownload"
license=('MIT')
options=(!strip)
providers="BilibiliVideoDownload"
conflits=()
depends=(zlib hicolor-icon-theme)
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/BilibiliVideoDownload-${pkgver}.AppImage")
sha256sums=('e623be15d2779963943d4290cdfa89aa5d685fb0d78eee0a252cf908d60f6ba2')
_install_path="/opt/appimages"
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/bilibilivideodownloader.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}