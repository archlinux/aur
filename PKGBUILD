# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=weread
pkgname="unoffical-${_pkgname}-appimage"
_appname="com-tw93-${_pkgname}"
pkgver=2.0.0
pkgrel=1
pkgdesc="Unoffical WeRead Appimage Client.微信读书是广州腾讯科技有限公司推出的阅读软件.为用户推荐合适的书籍，并可查看微信好友的读书动态、与好友讨论正在阅读的书籍等."
arch=('x86_64')
url="https://weread.qq.com"
_githuburl="https://github.com/tw93/Pake"
license=(custom)
conflicts=("${_pkgname}-pake")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/V${pkgver}/WeRead_x86_64.AppImage"
    "LICENSE.html::https://weread.qq.com/web/copyright")
sha256sums=('156b74ba4a548f86c86fc73e2e9922cc4169c73221dc72b15002a6eef7f9537e'
            'a92c199faf67e7ad503dc441e8ceb1d4c79f2516d3237386d27b6995daf259f8')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=com-tw93-weread|Exec=/opt/appimages/weread.AppImage|g;s|Icon=com-tw93-weread|Icon=weread|g;s|Name=com-tw93-weread|Name=WeRead|g;s|Development|Utility|g' \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
         
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_appname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
