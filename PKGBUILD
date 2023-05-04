# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="flomo-pake"
_appname="com-tw93-flomo"
pkgver=2.0.0
pkgrel=1
pkgdesc="Use Pake to package Flomo.浮墨笔记,像发微博一样记笔记,记录你想法的川流.全平台覆盖,还支持微信服务号输入."
arch=('x86_64')
url="https://flomoapp.com/"
_githuburl="https://github.com/tw93/Pake"
license=("custom")
conflicts=("${pkgname%-pake}")
depends=('hicolor-icon-theme' 'gcc-libs' 'glib2' 'gtk3' 'gdk-pixbuf2' 'glibc' 'cairo' 'webkit2gtk' 'dbus' 'openssl-1.1' 'pango')
makedepends=('gendesk')
source=("${pkgname%-pake}-${pkgver}.deb::${_githuburl}/releases/download/V${pkgver}/Flomo_x86_64.deb"
    "LICENSE.html::https://help.flomoapp.com/legal/")
sha256sums=('12f00b217aa4e21a62d57252a8ba0d264a715c3eda65562c036881bae87a4370'
            '892aa0d19693df1873cf852f826162023abd468392709109b0287af5e920e69f')
package() {
    bsdtar -xvf data.tar.gz -C "${pkgdir}" --gname root --uname root
    install -Dm755 -d "${pkgdir}/opt/apps/${pkgname%-pake}"
    mv "${pkgdir}/usr/bin/${_appname}" "${pkgdir}/opt/apps/${pkgname%-pake}/${pkgname%-pake}"
    rm -rf "${pkgdir}/usr/share/applications" "${pkgdir}/usr/bin"
    gendesk -f --icon "${pkgname%-pake}" --categories "Utility" --name "${pkgname%-pake}" --exec "/opt/apps/${pkgname%-pake}/${pkgname%-pake}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    mv "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-pake}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}