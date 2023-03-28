# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=flomo
pkgname="unoffical-${_pkgname}-appimage"
_appname="com-tw93-${_pkgname}"
pkgver=1.0.8
pkgrel=1
pkgdesc="Unoffical Flomo Appimage Client.浮墨笔记,像发微博一样记笔记,记录你想法的川流.全平台覆盖,还支持微信服务号输入."
arch=('x86_64')
url="https://flomoapp.com/"
_githuburl="https://github.com/tw93/Pake"
license=(custom)
conflicts=("${_pkgname}-pake")
depends=(hicolor-icon-theme zlib glibc)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/V${pkgver}/Flomo_x86_64.AppImage"
    "LICENSE::https://help.flomoapp.com/legal/")
sha256sums=('b0bf6bc1e851ba602445e66a9798d01a6edb9fdca3e09d0bb0b26b16359c0348'
            'c73f9b584e1b15ae5587fb9180ba45c1090b9e247f63c3abd45869ce0de33d78')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=com-tw93-flomo/Exec=\/opt\/appimages\/flomo.AppImage/g;s/Icon=com-tw93-flomo/Icon=flomo/g;s/Name=com-tw93-flomo/Name=Flomo/g' \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_appname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}