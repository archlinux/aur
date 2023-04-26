# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hyperkeys-appimage
pkgver=1.3.0
pkgrel=1
pkgdesc="Unleash you keyboard shorcuts"
arch=('x86_64')
url="https://hyperkeys.xureilab.com/"
_githuburl="https://github.com/xurei/hyperkeys"
license=('GPL3')
options=(!strip)
providers=()
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/HyperKeys-${pkgver}.AppImage")
sha256sums=('2884e6025aa4dfee198f1279584e8ec798d8f9519cbe8c6ed1f4648b26e63711')
_install_path="/opt/appimages"
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/hyperkeys.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
       
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}