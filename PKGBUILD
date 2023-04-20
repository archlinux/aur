# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="oh-mymd-appimage"
_appname=ohmymd
pkgver=0.5.0
pkgrel=1
pkgdesc="A markdown editor,support cloud sync"
arch=('x86_64')
url="https://www.ohmymd.app/"
_githuburl="https://github.com/1oopstudio/support.ohmymd.app"
license=(unknown)
options=(!strip)
providers=()
conflits=("${pkgname%-appimage}")
depends=(zlib hicolor-icon-theme glibc)
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/Oh.Mymd-${pkgver}.AppImage")
sha256sums=('b808475f7971ad0d0617d993be36435271ac88ddcc7a54cfd6ea71ebe3651039')
_install_path="/opt/appimages"
 
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/oh-mymd.AppImage|g;s|ohmymd|oh-mymd|g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
   
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}