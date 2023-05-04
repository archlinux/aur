# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=qwerty
pkgname="unoffical-${_pkgname}-learner-appimage"
_appname="com-tw93-${_pkgname}"
pkgver=2.0.0alpha
_pkgver=2.0.0-alpha
pkgrel=1
pkgdesc="Unoffical Qwerty-Learner Appimage Client.为键盘工作者设计的单词记忆与英语肌肉记忆锻炼软件/Words learning and English muscle memory training software designed for keyboard workers"
arch=('x86_64')
url="https://qwerty.kaiyi.cool"
_githuburl="https://github.com/tw93/Pake"
license=(GPL3)
conflicts=("${_pkgname}-learner-pake")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
_install_path="/opt/appimages"
source=("${_pkgname}-${_pkgver}.AppImage::${_githuburl}/releases/download/V${_pkgver}/qwerty_x86_64.AppImage")
sha256sums=('d939dc0a2b8ecd310b214378268abdcee5b5ac563dc9bc5380e33d98174596f5')
prepare() {
    chmod a+x "${_pkgname}-${_pkgver}.AppImage"
    "./${_pkgname}-${_pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=com-tw93-qwerty|Exec=/opt/appimages/qwerty.AppImage|g;s|Icon=com-tw93-qwerty|Icon=qwerty|g;s|Name=com-tw93-qwerty|Name=Qwerty Learner|g;s|Development|Utility|g' \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
        
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${_pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_appname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}
