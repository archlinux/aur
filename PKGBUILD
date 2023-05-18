# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=firefly-desktop-appimage
pkgver=2.1.1
pkgrel=1
pkgdesc="The official IOTA and Shimmer wallet"
arch=('x86_64')
url="https://firefly.iota.org/"
_githuburl="https://github.com/iotaledger/firefly"
license=('Apache')
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/desktop-${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage")
sha256sums=('4474f38d9ddf526d045927ad9cba08a841d550731a8994de6ed04b603582f050')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/firefly-desktop.AppImage|g;s|desktop|firefly-desktop|g' -i "${srcdir}/squashfs-root/desktop.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/desktop.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/desktop.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}