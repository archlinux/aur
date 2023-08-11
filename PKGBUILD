# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fishing-funds-appimage
_appname=Fishing-Funds
pkgver=8.0.1
pkgrel=2
pkgdesc="基金,大盘,股票,虚拟货币状态栏显示小应用,基于Electron开发."
arch=('x86_64')
url="https://ff.1zilc.top/"
_githuburl="https://github.com/1zilc/${pkgname%-appimage}"
license=('GPL3')
conflicts=("${pkgname%-appimage}")
provides=("${pkgname%-appimage}=${pkgver}")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}.AppImage")
sha256sums=('806269b788fda2fb3c1519f3086dfa2f96094b9d03081792fcfbeb5f18a94114')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}