# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=fishing-funds
pkgname="${_pkgname}-appimage"
pkgver=7.1.0
pkgrel=1
pkgdesc="基金,大盘,股票,虚拟货币状态栏显示小应用,基于Electron开发."
arch=('x86_64')
url="https://ff.1zilc.top/"
_githuburl="https://github.com/1zilc/${_pkgname}"
license=('GPL3')
conflicts=("${_pkgname}")
providers=("${_pkgname}")
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
_install_path="/opt/appimages"
source=(
  "${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Fishing-Funds-${pkgver}.AppImage"
)
sha256sums=('6495da050acbc068812a6e9831b9946d87ed9cb7be449b6c04cd50471c422ed1')
     
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    ./"${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/fishing-funds.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}