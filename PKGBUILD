# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=flomo
pkgname="unoffical-${_pkgname}-appimage"
_appname="com-tw93-${_pkgname}"
pkgver=2.0.0
pkgrel=1
pkgdesc="Unoffical Flomo Appimage Client.浮墨笔记,像发微博一样记笔记,记录你想法的川流.全平台覆盖,还支持微信服务号输入."
arch=('x86_64')
url="https://flomoapp.com/"
_githuburl="https://github.com/tw93/Pake"
license=(custom)
conflicts=("${_pkgname}-pake")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/V${pkgver}/Flomo_x86_64.AppImage"
    "LICENSE.html::https://help.flomoapp.com/legal/")
sha256sums=('5d895564e71bad6866e0cd6d503e7f55f892fc2a266f46f008668a5c524bebb6'
            '892aa0d19693df1873cf852f826162023abd468392709109b0287af5e920e69f')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=com-tw93-flomo|Exec=/opt/appimages/flomo.AppImage|g;s|Icon=com-tw93-flomo|Icon=flomo|g;s|Name=com-tw93-flomo|Name=Flomo|g' \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_appname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
