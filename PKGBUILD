# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=whalebird-appimage
pkgver=5.0.6
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
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Whalebird-${pkgver}-linux-${CARCH}.AppImage")
sha256sums=('320f267c7ff385bc4e92b6a7d4c57fc11492dbefbbb89d7880d16d93be4fd5ea')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
} 
package() {
  install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
  install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
}