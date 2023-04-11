# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=flomo
pkgname="${_pkgname}-pake"
_appname="com-tw93-${_pkgname}"
pkgver=2.0.0alpha
_pkgver=2.0.0-alpha
pkgrel=1
pkgdesc="Use Pake to package Flomo.浮墨笔记,像发微博一样记笔记,记录你想法的川流.全平台覆盖,还支持微信服务号输入."
arch=('x86_64')
url="https://flomoapp.com/"
_githuburl="https://github.com/tw93/Pake"
license=(custom)
conflicts=("${_pkgname}")
depends=('hicolor-icon-theme' 'gcc-libs' 'glib2' 'gtk3' 'gdk-pixbuf2' 'glibc' 'cairo' 'webkit2gtk' 'dbus' 'openssl-1.1')
source=("${_pkgname}-${_pkgver}.deb::${_githuburl}/releases/download/V${_pkgver}/Flomo_x86_64.deb"
    "LICENSE::https://help.flomoapp.com/legal/")
sha256sums=('24ee47a8ea13f6c4959bf29e0e76c57f0527b1c183fb1cd052028de9401d8511'
            '2fbdc2bcafb5089bffb36aa16a49130d92c0bf5fad3092694330fb2d878b4a23')
package() {
    bsdtar -xvf data.tar.gz -C "${pkgdir}" --gname root --uname root
    install -Dm755 -d "${pkgdir}/opt/apps/${_pkgname}"
    mv "${pkgdir}/usr/bin/${_appname}" "${pkgdir}/opt/apps/${_pkgname}/${_pkgname}"
    rm -rf "${pkgdir}/usr/share/applications" "${pkgdir}/usr/bin"
    gendesk -f --pkgname "${_pkgname}" --pkgdesc "浮墨笔记,像发微博一样记笔记,记录你想法的川流.全平台覆盖,还支持微信服务号输入." --icon "${_pkgname}" \
        --categories "Utility;" --name "${_pkgname}" --exec "/opt/apps/${_pkgname}/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    mv "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
