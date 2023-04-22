# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=feidao-appimage
pkgver=1.0.0
pkgrel=3
epoch=
pkgdesc="飞稻在线课程设计平台"
arch=("x86_64")
url="https://www.fei-dao.com"
license=('unknown')
depends=('zlib' 'hicolor-icon-theme' 'glibc')
options=(!strip)
optdepends=()
provides=()
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::https://oss.fei-dao.com/resources/application/linux/${pkgname%-appimage}_latest.AppImage")
sha256sums=('2a5f5919ebc8c7ef8ebd232758852c87dd0b165208dc46a501ce3cefdd23ded7')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/feidao.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 128x128 256x256 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}