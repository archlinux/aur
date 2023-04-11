# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=weread
pkgname="${_pkgname}-pake"
_appname="com-tw93-${_pkgname}"
pkgver=2.0.0alpha
_pkgver=2.0.0-alpha
pkgrel=1
pkgdesc="Use Pake to package WeRead.微信读书是广州腾讯科技有限公司推出的阅读软件.为用户推荐合适的书籍，并可查看微信好友的读书动态、与好友讨论正在阅读的书籍等."
arch=('x86_64')
url="https://weread.qq.com/"
_githuburl="https://github.com/tw93/Pake"
license=(custom)
conflicts=("${_pkgname}")
depends=('hicolor-icon-theme' 'gcc-libs' 'glib2' 'dbus' 'gtk3' 'gdk-pixbuf2' 'glibc' 'cairo' 'webkit2gtk' 'openssl-1.1')
source=("${pkgname}-${_pkgver}.deb::${_githuburl}/releases/download/V${_pkgver}/WeRead_x86_64.deb"
    "LICENSE.html::https://weread.qq.com/web/copyright")
sha256sums=('9e9d9fe9b2656ac381174974c10d27c2657cfbbc46fe434f8b55e8828269df87'
            '8236399aa0697f0ca53660fe8e895e32b2cd10db6adcaea4c4c987ba1c856c09')
package() {
    bsdtar -xvf data.tar.gz -C "${pkgdir}" --gname root --uname root
    install -Dm755 -d "${pkgdir}/opt/apps/${_pkgname}"
    mv "${pkgdir}/usr/bin/${_appname}" "${pkgdir}/opt/apps/${_pkgname}/${_pkgname}"
    rm -rf "${pkgdir}/usr/share/applications" "${pkgdir}/usr/bin"
    gendesk -f --pkgname "${_pkgname}" --pkgdesc "微信读书是广州腾讯科技有限公司推出的阅读软件.为用户推荐合适的书籍，并可查看微信好友的读书动态、与好友讨论正在阅读的书籍等." \
        --icon "${_pkgname}" --categories "Utility;" --name "${_pkgname}" --exec "/opt/apps/${_pkgname}/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    mv "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}