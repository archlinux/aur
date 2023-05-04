# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=qwerty
pkgname="qwerty-learner-pake"
_appname="com-tw93-${_pkgname}"
pkgver=2.0.0
pkgrel=1
pkgdesc="Use Pake to package Qwerty-Learner.为键盘工作者设计的单词记忆与英语肌肉记忆锻炼软件/Words learning and English muscle memory training software designed for keyboard workers"
arch=('x86_64')
url="https://qwerty.kaiyi.cool"
_githuburl="https://github.com/tw93/Pake"
license=(GPL3)
conflicts=("${_pkgname}")
depends=('hicolor-icon-theme' 'gcc-libs' 'glib2' 'dbus' 'gtk3' 'gdk-pixbuf2' 'glibc' 'cairo' 'webkit2gtk' 'openssl-1.1' 'pango')
source=("${pkgname}-${pkgver}.deb::${_githuburl}/releases/download/V${pkgver}/Qwerty_x86_64.deb")
sha256sums=('b540794dcf838bdea527ac4de9ecd5da7e38a2c017aa4857602a4fe55403b829')
package() {
    bsdtar -xvf data.tar.gz -C "${pkgdir}" --gname root --uname root
    install -Dm755 -d "${pkgdir}/opt/apps/${_pkgname}"
    mv "${pkgdir}/usr/bin/${_appname}" "${pkgdir}/opt/apps/${_pkgname}/${_pkgname}"
    rm -rf "${pkgdir}/usr/share/applications" "${pkgdir}/usr/bin"
    gendesk -f --icon "qwerty" --categories "Utility" --name "Qwerty-Learner" --exec "/opt/apps/${_pkgname}/${_pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    mv "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}