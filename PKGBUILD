# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="alephium-wallet-appimage"
pkgver=2.0.2
pkgrel=1
pkgdesc="The official Alephium wallet for desktop"
arch=('x86_64')
url="https://alephium.org/"
_githuburl="https://github.com/alephium/desktop-wallet"
license=('LGPL3')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Alephium-${pkgver}.AppImage")
sha256sums=('9853c2aafa3b608a4f2f623129accb499ba25a1201ecb82c7a4c773d6a51f65b')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|Finance|Finance;Utility|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}