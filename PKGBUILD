# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=whalebird-appimage
pkgver=5.0.5
pkgrel=1
pkgdesc="An Electron based Mastodon, Pleroma, and Misskey client"
arch=('x86_64')
url="https://whalebird.social/"
_githuburl="https://github.com/h3poteto/whalebird-desktop"
license=('GPL3')
depends=('zlib' 'glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}" "${pkgname%-appimage}-desktop-git")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Whalebird-${pkgver}-linux-x86_64.AppImage")
sha256sums=('c60da1d548f68531cc9b3ec02bc95b622af25aa803fdf762ae72cfa8dba74d5c')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/whalebird.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
} 
package() {
  install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
  install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
}
