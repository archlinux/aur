# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=panwriter-appimage
pkgver=0.8.5
pkgrel=1
pkgdesc="Markdown editor with pandoc integration and paginated preview."
arch=('any')
url="https://panwriter.com/"
_githuburl="https://github.com/mb21/panwriter"
license=('GPL3')
depends=('zlib' 'glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/PanWriter-${pkgver}.AppImage")
sha256sums=('ea3390a5371cdfa45d921c160b26c5cb94e6ba9f8f6e1809f3d8d569da38912e')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/panwriter.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
} 
package() {
  install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
  install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
}