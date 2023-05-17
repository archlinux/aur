# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="promethium-appimage"
pkgver=6.1.6
pkgrel=1
pkgdesc="Extensible, fast, and innovative Electron based web browser with Material UI design elements and built-in AdBlock."
arch=('x86_64')
url="https://github.com/Alex313031/promethium"
license=('GPL3')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Promethium_${pkgver}_${arch}.AppImage")
sha256sums=('c0eee71501b4f6e5530db964b00ed0a97898b6b01a53c905559fdc2636d75903')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/promethium.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}