# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bilibili-videodownloader-appimage
_pkgname=bilibilivideodownload
pkgver=3.3.3
pkgrel=2
pkgdesc="Cross-platform download bilibili video desktop software, support windows, macOS, Linux"
arch=('x86_64')
url="https://github.com/BilibiliVideoDownload/BilibiliVideoDownload"
license=(MIT)
options=(!strip)
providers="BilibiliVideoDownload"
conflits=("${_pkgname}")
depends=(zlib hicolor-icon-theme glibc)
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/BilibiliVideoDownload-${pkgver}.AppImage"
    "LICENSE::${url}/raw/master/LICENSE")
sha256sums=('e623be15d2779963943d4290cdfa89aa5d685fb0d78eee0a252cf908d60f6ba2'
            '9c4015a0827b71d43e2136e15912bc9a275527c455c998e6757439f1c29931b6')
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
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
