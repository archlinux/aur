# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="chatpad-ai-appimage"
_appname="Chatpad-AI"
pkgver=1.4.0
pkgrel=1
pkgdesc="Not just another ChatGPT user-interface!"
arch=("x86_64")
url="https://chatpad.ai/"
_githuburl="https://github.com/deiucanta/chatpad"
license=('AGPL3')
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}" "${pkgname%-appimage}-patterns")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::https://dl.todesktop.com/230313oyppkw40a")
sha256sums=('05593b7575fe119cb08aa6049cb93d76dc2cfe0cc86fc0db2d22601f453d9c93')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/chatpad-ai.AppImage|g;s|Chatpad-AI|chatpad-ai|g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
  
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
}