# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="notekit-appimage"
_appname="com.github.blackhole89.notekit"
pkgver=0.2.0
pkgrel=1
pkgdesc="A GTK3 hierarchical markdown notetaking application with tablet support."
arch=('x86_64')
url="https://github.com/blackhole89/notekit"
license=('GPL3')
depends=('glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}+git1.73c1a86-Build6.1.glibc2.14-x86_64.AppImage")
sha256sums=('bf17231318c8017a90d1df84ccc9675235fddc2cc0616b4a7151766f5b0c7ae3')
  
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=notekit|Exec=/opt/appimages/notekit.AppImage|g;s|com.github.blackhole89.notekit|notekit|g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
      
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/128x128/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}