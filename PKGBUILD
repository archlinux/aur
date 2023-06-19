# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deltachat-desktop-appimage
pkgver=1.37.1
pkgrel=1
pkgdesc="Email-based instant messaging for Desktop."
arch=('x86_64')
url="https://github.com/deltachat/deltachat-desktop"
license=('GPL3')
provides=(deltachat)
conflits=("${pkgname%-appimage}")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/DeltaChat-${pkgver}.AppImage")
_install_path="/opt/appimages"
sha256sums=('383303b6d81e7cc7ef0f3ec81b9bd8a808282d645b6a6aae59de5eff7068e2f9')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}