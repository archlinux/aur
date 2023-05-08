# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=buttercup-desktop-appimage
pkgver=2.19.1
pkgrel=1
pkgdesc="Cross-Platform Passwords & Secrets Vault"
arch=('x86_64')
url="https://buttercup.pw/"
_githuburl="https://github.com/buttercup/buttercup-desktop"
license=('GPL3')
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Buttercup-linux-x86_64.AppImage")
sha256sums=('10b2573e7af99451c8803b2a8db19b72da3424bb22d75b0c7bb5233a48b9c900')
_install_path="/opt/appimages"
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/buttercup-desktop.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-desktop-appimage}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-desktop-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-desktop-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}