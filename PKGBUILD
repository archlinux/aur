# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=loop
pkgname="unoffical-microsoft-${_pkgname}-appimage"
_appname="com-tw93-${_pkgname}"
pkgver=2.0.0alpha
_pkgver=2.0.0-alpha
pkgrel=1
pkgdesc="Unoffical Microsoft Loop Appimage Client.Microsoft Loop is about people—people who want to create together with ease, no matter where they are or what tools they use."
arch=('x86_64')
url="https://www.microsoft.com/en-us/microsoft-loop"
_githuburl="https://github.com/tw93/Pake"
license=(custom)
conflicts=("${_pkgname}-pake")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
_install_path="/opt/appimages"
source=("${_pkgname}-${_pkgver}.AppImage::${_githuburl}/releases/download/V${_pkgver}/Loop_x86_64.AppImage"
    "LICENSE.html::https://go.microsoft.com/fwlink/?LinkID=206977")
sha256sums=('7bfe4291d20a87d85a4badd74d8b843e941cd4cfc23b049bff8b65c6324013dc'
            '785540a7a428b96b8f36cb466f76d4582fcc887745cdb5de4c4f06a18c78a78d')
prepare() {
    chmod a+x "${_pkgname}-${_pkgver}.AppImage"
    "./${_pkgname}-${_pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=com-tw93-loop|Exec=/opt/appimages/loop.AppImage|g;s|Icon=com-tw93-loop|Icon=loop|g;s|Name=com-tw93-loop|Name=Microsoft Loop|g;s|Categories=Development|Categories=Utility|g' \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
       
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${_pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_appname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}