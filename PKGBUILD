# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="thedesk-appimage"
pkgver=24.1.2
pkgrel=1
pkgdesc="Mastodon Client for PC."
arch=("x86_64")
url="https://thedesk.top/"
_githuburl="https://github.com/cutls/TheDesk"
license=('GPL3')
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}" "${pkgname%-appimage}-patterns")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/TheDesk-${pkgver}.AppImage")
sha256sums=('640c2ccaa79e96166e2bf9fde819cb14b043ee3703f95d44b0e220f728d60c3e')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/thedesk.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
  
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}