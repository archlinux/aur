# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=knowledge-appimage
pkgver=0.8.2
pkgrel=1
pkgdesc="A tool for saving, searching, accessing, and exploring all of your favorite websites, documents and files."
arch=('x86_64')
url="https://github.com/KnowledgeCanvas/knowledge"
license=('Apache')
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::https://knowledge-canvas.s3.us-west-2.amazonaws.com/Knowledge-${pkgver}.AppImage")
sha256sums=('4d7890c78c35636b45745b2e8145c884cb5cd2ee3f777ae15e3ffcea732af081')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/knowledge.AppImage|g;s|knowledge-canvas|knowledge|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}-canvas.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}-canvas.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}-canvas.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
}