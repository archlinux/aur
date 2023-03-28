# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=loop
pkgname="unoffical-microsoft-${_pkgname}-appimage"
_appname="com-tw93-${_pkgname}"
pkgver=1.0.8
pkgrel=1
pkgdesc="Unoffical Microsoft Loop Appimage Client.Microsoft Loop is about people—people who want to create together with ease, no matter where they are or what tools they use."
arch=('x86_64')
url="https://www.microsoft.com/en-us/microsoft-loop"
_githuburl="https://github.com/tw93/Pake"
license=(custom)
conflicts=("${_pkgname}-pake")
depends=(hicolor-icon-theme zlib glibc)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/V${pkgver}/Loop_x86_64.AppImage"
    "LICENSE::https://go.microsoft.com/fwlink/?LinkID=206977")
sha256sums=('9f2d2305a77951ebd6342b50abf6df48e58b7370abe0873cb28a1289a21ba417'
            'd0ea2744b94405b171bbef551183924be0ce8dbd694f6cc230e6a9668543f800')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=com-tw93-loop/Exec=\/opt\/appimages\/loop.AppImage/g;s/Icon=com-tw93-loop/Icon=loop/g;s/Name=com-tw93-loop/Name=Microsoft Loop/g;s/Categories=Development/Categories=Utility/g' \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
       
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_appname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}