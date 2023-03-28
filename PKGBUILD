# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=lizhi
pkgname="unoffical-${_pkgname}-appimage"
_appname="com-tw93-${_pkgname}"
pkgver=1.0.8
pkgrel=1
pkgdesc="Unoffical LiZhi Appimage Client.荔枝App是中国领先的用户原创内容音频社区、互动音频娱乐平台和在线音频平台,致力于使用户能在移动端通过声音记录和分享生活."
arch=('x86_64')
url="https://www.lizhi.fm"
_githuburl="https://github.com/tw93/Pake"
license=(custom)
conflicts=("${_pkgname}-pake")
depends=(hicolor-icon-theme zlib glibc)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/V${pkgver}/LiZhi_x86_64.AppImage"
    "LICENSE::https://www.lizhi.fm/about/agreement.html")
sha256sums=('876dd69bde21bb238b19e2741831cf8eeea532f3bc07de39ee434be04fe51d1b'
            '1c490b4f24684353fbc08b9d0a9008214b2cd61aef4675151b9ee96d728396b4')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=com-tw93-lizhi/Exec=\/opt\/appimages\/lizhi.AppImage/g;s/Icon=com-tw93-lizhi/Icon=lizhi/g;s/Name=com-tw93-lizhi/Name=LiZhi/g;s/Categories=Development/Categories=AudioVideo/g' \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
      
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_appname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}