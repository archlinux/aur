# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=eudic-appimage
_pkgname=eudic
pkgver=12.7.1
pkgrel=2
pkgdesc="权威的英语词典软件,英语学习者必备的工具,支持学习笔记、生词本多平台同步,让你随时随地学英语."
arch=('x86_64')
url="https://www.eudic.net/v4/en/app/eudic"
license=('unknown')
options=(!strip)
conflicts=('eudic')
depends=('hicolor-icon-theme' 'zlib')
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::http://static-main.frdic.com/pkg/eudic.AppImage")
sha256sums=('7fb7d6dabc1faf46d7c09cb428d7728ad88372bbb690a48b4a140884e787ba1a')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g;s/Icon=/\#Icon=e/g' -i "${srcdir}/squashfs-root/default.desktop"
    echo "Exec=/opt/appimages/eudic.AppImage %F" >> "${srcdir}/squashfs-root/default.desktop"
    echo "Icon=eudic" >> "${srcdir}/squashfs-root/default.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/com.eusoft.eudic.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
