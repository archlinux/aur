# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=uivonim-appimage
pkgver=0.29.0
pkgrel=1
pkgdesc="Fork of the Veonim Neovim GUI"
arch=('x86_64')
url="https://github.com/smolck/uivonim"
license=('AGPL3')
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage")
sha256sums=('fe00f3085aea994003f159d407423eecbccdf1d34dc685dfff6ddbeb73509b77')
_install_path="/opt/appimages"
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/uivonim.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}