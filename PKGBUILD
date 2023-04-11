# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=qwerty
pkgname="${_pkgname}-learner-pake"
_appname="com-tw93-${_pkgname}"
pkgver=2.0.0alpha
_pkgver=2.0.0-alpha
pkgrel=1
pkgdesc="Use Pake to package Qwerty-Learner.为键盘工作者设计的单词记忆与英语肌肉记忆锻炼软件/Words learning and English muscle memory training software designed for keyboard workers"
arch=('x86_64')
url="https://qwerty.kaiyi.cool"
_githuburl="https://github.com/tw93/Pake"
license=(GPL3)
conflicts=("${_pkgname}")
depends=('hicolor-icon-theme' 'gcc-libs' 'glib2' 'dbus' 'gtk3' 'gdk-pixbuf2' 'glibc' 'cairo' 'webkit2gtk' 'openssl-1.1')
source=("${pkgname}-${_pkgver}.deb::${_githuburl}/releases/download/V${_pkgver}/Qwerty_x86_64.deb")
sha256sums=('17b8f6700ca72f0d02b1b9a9d8c717adba48d4ea84170b19a6c205d3339307a0')
package() {
    bsdtar -xvf data.tar.gz -C "${pkgdir}" --gname root --uname root
    install -Dm755 -d "${pkgdir}/opt/apps/${_pkgname}"
    mv "${pkgdir}/usr/bin/${_appname}" "${pkgdir}/opt/apps/${_pkgname}/${_pkgname}"
    rm -rf "${pkgdir}/usr/share/applications" "${pkgdir}/usr/bin"
    gendesk -f --pkgname "${_pkgname}" --pkgdesc "为键盘工作者设计的单词记忆与英语肌肉记忆锻炼软件/Words learning and English muscle memory training software designed for keyboard workers" \
        --icon "${_pkgname}" --categories "Utility;" --name "${_pkgname}" --exec "/opt/apps/${_pkgname}/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    mv "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}
