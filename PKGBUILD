# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=notes-nc-appimage
pkgver=0.7.2
pkgrel=1
pkgdesc="Cross-platform Notes desktop application for markdown notes"
arch=('x86_64')
url="https://github.com/mscharley/notes-nc"
license=('MIT')
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Notes-${pkgver}.AppImage"
    "LICENSE.md::https://raw.githubusercontent.com/mscharley/notes-nc/main/LICENSE.md")
sha256sums=('0aed5df1e7d6d17064f2182545600637e788f6adf0a45c248c3cd08a8e5f6c5c'
            '3dcc1e196d70d5503a020194e91d5d663f428c349622d1f0eb545ec2f354264b')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}