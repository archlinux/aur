# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vagrant-manager-appimage
pkgver=2.3.2
pkgrel=1
pkgdesc="An electron, status bar menu app that lets you manage all of your vagrant machines from one central location."
arch=("i686" "x86_64")
url="https://github.com/absalomedia/vagrant-manager"
license=("MIT")
depends=('zlib' 'glibc')
options=(!strip)
conflit=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source_i686=("${pkgname%-appimage}-${pkgver}-i686.AppImage::${url}/releases/download/${pkgver}/${pkgname%-appimage}-i386.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${url}/releases/download/${pkgver}/${pkgname%-appimage}-x86_64.AppImage")
source=("LICENSE.md::https://raw.githubusercontent.com/absalomedia/vagrant-manager/master/LICENSE.md")
sha256sums=('aab8e4332f27b8c96aad7427a304e40a612f62af9bef709505452bd04d136c03')
sha256sums_i686=('e7a265e87fb4a4d53970054ccb37a046656a985b7fffdddbaa6345f6033a9dfa')
sha256sums_x86_64=('3f40ff1a01a88bb578b1facccc3b44a4ff3bb9de69169eae22413309adfc587d')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "./${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}