# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="weread-pake"
_appname="com-tw93-weread"
pkgver=2.0.0
pkgrel=1
pkgdesc="Use Pake to package WeRead.微信读书是广州腾讯科技有限公司推出的阅读软件.为用户推荐合适的书籍，并可查看微信好友的读书动态、与好友讨论正在阅读的书籍等."
arch=('x86_64')
url="https://weread.qq.com/"
_githuburl="https://github.com/tw93/Pake"
license=(custom)
conflicts=("${pkgname%-pake}")
depends=('hicolor-icon-theme' 'gcc-libs' 'glib2' 'dbus' 'gtk3' 'gdk-pixbuf2' 'glibc' 'cairo' 'webkit2gtk' 'openssl-1.1' 'pango')
source=("${pkgname}-${pkgver}.deb::${_githuburl}/releases/download/V${pkgver}/WeRead_x86_64.deb"
    "LICENSE.html::https://weread.qq.com/web/copyright")
sha256sums=('e6e2b59259d93ce86f6f3e7e8b5ff6a31a6d98c41969e279fc19f55a45f5083f'
            'a92c199faf67e7ad503dc441e8ceb1d4c79f2516d3237386d27b6995daf259f8')
package() {
    bsdtar -xvf data.tar.gz -C "${pkgdir}" --gname root --uname root
    install -Dm755 -d "${pkgdir}/opt/apps/${pkgname%-pake}"
    mv "${pkgdir}/usr/bin/${_appname}" "${pkgdir}/opt/apps/${pkgname%-pake}/${pkgname%-pake}"
    rm -rf "${pkgdir}/usr/share/applications" "${pkgdir}/usr/bin"
    gendesk -f --icon "${pkgname%-pake}" --categories "Utility" --name "${pkgname%-pake}" --exec "/opt/apps/${pkgname%-pake}/${pkgname%-pake}"
    install -Dm644 "${srcdir}/${pkgname%}.desktop" -t "${pkgdir}/usr/share/applications"
    mv "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-pake}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}