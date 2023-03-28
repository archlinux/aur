# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=weread
pkgname="${_pkgname}-pake"
_appname="com-tw93-${_pkgname}"
pkgver=1.0.8
pkgrel=1
pkgdesc="Use Pake to package WeRead.微信读书是广州腾讯科技有限公司推出的阅读软件.为用户推荐合适的书籍，并可查看微信好友的读书动态、与好友讨论正在阅读的书籍等."
arch=('x86_64')
url="https://weread.qq.com/"
_githuburl="https://github.com/tw93/Pake"
license=(custom)
conflicts=("${_pkgname}")
depends=(hicolor-icon-theme gcc-libs glib2 pango gtk3 gdk-pixbuf2 glibc cairo webkit2gtk)
source=("${pkgname}-${pkgver}.deb::${_githuburl}/releases/download/V${pkgver}/WeRead_x86_64.deb"
    "LICENSE::https://weread.qq.com/web/copyright")
sha256sums=('4c054a0195bf3487f17ee8839db1438362ba9bf07ec7b6a3323fdbfb212dda2a'
            '50200c291ea39ecb3bad8003219e3249ad07160f6615338e1a4a40cd8d21cdd5')
package() {
    bsdtar -xvf data.tar.gz -C "${pkgdir}" --gname root --uname root
    install -Dm755 -d "${pkgdir}/opt/apps/${_pkgname}"
    mv "${pkgdir}/usr/bin/${_appname}" "${pkgdir}/opt/apps/${_pkgname}/${_pkgname}"
    rm -rf "${pkgdir}/usr/share/applications" "${pkgdir}/usr/bin"
    gendesk -f --pkgname "${_pkgname}" --pkgdesc "微信读书是广州腾讯科技有限公司推出的阅读软件.为用户推荐合适的书籍，并可查看微信好友的读书动态、与好友讨论正在阅读的书籍等." \
        --icon "${_pkgname}" --categories "Utility;" --name "${_pkgname}" --exec "/opt/apps/${_pkgname}/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    mv "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
