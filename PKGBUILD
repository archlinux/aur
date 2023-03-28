# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=qwerty
pkgname="unoffical-${_pkgname}-learner-appimage"
_appname="com-tw93-${_pkgname}"
pkgver=1.0.8
pkgrel=1
pkgdesc="Unoffical Qwerty-Learner Appimage Client.为键盘工作者设计的单词记忆与英语肌肉记忆锻炼软件/Words learning and English muscle memory training software designed for keyboard workers"
arch=('x86_64')
url="https://qwerty.kaiyi.cool"
_githuburl="https://github.com/tw93/Pake"
license=(GPL3)
conflicts=("${_pkgname}-learner-pake")
depends=(hicolor-icon-theme zlib glibc)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/V${pkgver}/qwerty_x86_64.AppImage")
sha256sums=('26f05e56709252f3fe6e75610bb08080bbd27c933dc9571d04acf71e3e26300c')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=com-tw93-qwerty/Exec=\/opt\/appimages\/qwerty.AppImage/g;s/Icon=com-tw93-qwerty/Icon=qwerty/g;s/Name=com-tw93-qwerty/Name=Qwerty Learner/g;s/Development/Utility/g' \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
        
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_appname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}