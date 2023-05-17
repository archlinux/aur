# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="alephium-wallet-appimage"
pkgver=2.0.1
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
sha256sums=('b25e0f60593b684f815dd75a0291f863b9943dd9be1207b48f2e9da7984dee21')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/alephium-wallet.AppImage|g;s|Finance|Finance;Utility|g' \
        -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}