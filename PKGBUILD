# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="shadowsocks-electron-appimage"
pkgver=1.2.3
pkgrel=1
pkgdesc="Shadowsocks GUI application made for Ubuntu/Mac/Win users and powered by Electron."
arch=('x86_64')
url="https://github.com/nojsja/shadowsocks-electron"
license=('GPL3')
options=(!strip)
conflicts=("${pkgname%-electron-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Shadowsocks-Electron-${pkgver}.AppImage")
sha256sums=('ec860bfe2fd56562246f53a0c1049088cfea2b33e36c5bff0839741653ff170d')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/shadowsocks-electron.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}
