# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hoptodesk-appimage
pkgver=1.40.4
pkgrel=1
pkgdesc="A free remote desktop tool that allows users to share their screens and remotely control access to their computers and devices."
arch=('x86_64')
url="https://www.hoptodesk.com"
#_gitlaburl="https://gitlab.com/hoptodesk/hoptodesk"
license=('freeware')
options=(!strip)
providers=()
conflits=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/hoptodesk.AppImage")
sha256sums=('8dd4ce3626bebde0ea5384b57fd5dbab748c3428d793d095886fba053fd24fec')
_install_path="/opt/appimages"
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|usr/bin/hoptodesk|/opt/appimages/hoptodesk.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 32x32 128x128;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}