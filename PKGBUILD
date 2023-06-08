# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="yank-note-appimage"
pkgver=3.54.0
pkgrel=1
pkgdesc="A Hackable Markdown Note Application for Programmers."
arch=('aarch64' 'armv7h' 'x86_64')
url="https://demo.yank-note.com/"
_githuburl="https://github.com/purocean/yn"
license=('AGPL3')
provides=()
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/Yank-Note-linux-arm64-${pkgver}.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver}/Yank-Note-linux-arm64-${pkgver}.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/Yank-Note-linux-x86_64-${pkgver}.AppImage")
sha256sums_aarch64=('d22d14d5801a00bccf8644431f6a8f85012b63c9a6a9521f5b1706a321ee6a3f')
sha256sums_armv7h=('d22d14d5801a00bccf8644431f6a8f85012b63c9a6a9521f5b1706a321ee6a3f')
sha256sums_x86_64=('9a134a1eb08e6e2d7d22e29fe04cc7fe20cdadabeb4274ccae306d26fa379950')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "./${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/yank-note.AppImage|g;s|=Markdown|=Development|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}