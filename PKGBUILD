# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=lizhi
pkgname="${_pkgname}-pake"
_appname="com-tw93-${_pkgname}"
pkgver=1.0.8
pkgrel=1
pkgdesc="Use Pake to package Lizhi fm.荔枝App是中国领先的用户原创内容音频社区、互动音频娱乐平台和在线音频平台,致力于使用户能在移动端通过声音记录和分享生活."
arch=('x86_64')
url="https://www.lizhi.fm/"
_githuburl="https://github.com/tw93/Pake"
license=(custom)
conflicts=("${_pkgname}")
depends=(hicolor-icon-theme gcc-libs glib2 pango gtk3 gdk-pixbuf2 glibc cairo webkit2gtk)
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/V${pkgver}/LiZhi_x86_64.deb"
    "LICENSE::https://www.lizhi.fm/about/agreement.html")
sha256sums=('9723ab9f779c6e1de1a7888a2bac7a2dc8240f3d3f0e347d0ad34b1af6106978'
            '1c490b4f24684353fbc08b9d0a9008214b2cd61aef4675151b9ee96d728396b4')
package() {
    bsdtar -xvf data.tar.gz -C "${pkgdir}" --gname root --uname root
    install -Dm755 -d "${pkgdir}/opt/apps/${_pkgname}"
    mv "${pkgdir}/usr/bin/${_appname}" "${pkgdir}/opt/apps/${_pkgname}/${_pkgname}"
    rm -rf "${pkgdir}/usr/share/applications" "${pkgdir}/usr/bin"
    gendesk -f --pkgname "${_pkgname}" --pkgdesc "荔枝App是中国领先的用户原创内容音频社区、互动音频娱乐平台和在线音频平台,致力于使用户能在移动端通过声音记录和分享生活." --icon "${_pkgname}" \
        --categories "Utility;" --name "${_pkgname}" --exec "/opt/apps/${_pkgname}/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    mv "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}