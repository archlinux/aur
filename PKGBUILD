# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=astrofox
pkgname="${_pkgname}-appimage"
pkgver=1.4.0
pkgrel=1
pkgdesc="A motion graphics program that lets you turn audio into amazing videos."
arch=('x86_64')
url="https://astrofox.io"
_githuburl="https://github.com/astrofox-io/astrofox"
license=('MIT')
options=(!strip)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=(zlib hicolor-icon-theme glibc)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::https://files.astrofox.io/download/Astrofox-${pkgver}.AppImage"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('05327ea2944741d8bab8ef5f8bfd33530fbbb72ad85b6e4c411714c6fd295b65'
            '2366e943e400fbf8d55651d8f29257f7a680ce6fcb428d0215e75362f8728e43')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/astrofox.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
      
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}