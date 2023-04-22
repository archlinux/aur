# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fishing-funds-appimage
pkgver=7.2.0
pkgrel=1
pkgdesc="基金,大盘,股票,虚拟货币状态栏显示小应用,基于Electron开发."
arch=('x86_64')
url="https://ff.1zilc.top/"
_githuburl="https://github.com/1zilc/${pkgname%-appimage}"
license=('GPL3')
conflicts=("${pkgname%-appimage}")
providers=("${pkgname%-appimage}")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Fishing-Funds-${pkgver}.AppImage")
sha256sums=('62e8dfd413e8f3705371a72a7a23ac0b1541ccfb2bf30c85c75f15b9c4207532')
     
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    ./"${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/fishing-funds.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}