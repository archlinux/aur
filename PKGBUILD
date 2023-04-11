# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=weread
pkgname="unoffical-${_pkgname}-appimage"
_appname="com-tw93-${_pkgname}"
pkgver=2.0.0alpha
_pkgver=2.0.0-alpha
pkgrel=1
pkgdesc="Unoffical WeRead Appimage Client.微信读书是广州腾讯科技有限公司推出的阅读软件.为用户推荐合适的书籍，并可查看微信好友的读书动态、与好友讨论正在阅读的书籍等."
arch=('x86_64')
url="https://weread.qq.com"
_githuburl="https://github.com/tw93/Pake"
license=(custom)
conflicts=("${_pkgname}-pake")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
_install_path="/opt/appimages"
source=("${_pkgname}-${_pkgver}.AppImage::${_githuburl}/releases/download/V${_pkgver}/WeRead_x86_64.AppImage"
    "LICENSE.html::https://weread.qq.com/web/copyright")
sha256sums=('b1f5caf0f432b4f6eb6944caaba041b91b9f4b565198e96999211f7065ebf910'
            '8236399aa0697f0ca53660fe8e895e32b2cd10db6adcaea4c4c987ba1c856c09')
prepare() {
    chmod a+x "${_pkgname}-${_pkgver}.AppImage"
    "./${_pkgname}-${_pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=com-tw93-weread|Exec=/opt/appimages/weread.AppImage|g;s|Icon=com-tw93-weread|Icon=weread|g;s|Name=com-tw93-weread|Name=WeRead|g;s|Development|Utility|g' \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
         
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${_pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_appname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}