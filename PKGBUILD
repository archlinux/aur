# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=notesnook
pkgname="${_pkgname}-appimage"
pkgver=2.4.6
pkgrel=1
pkgdesc="A fully open source & end-to-end encrypted note taking alternative to Evernote."
arch=('x86_64')
url="https://${_pkgname}.com/"
_githuburl="https://github.com/streetwriters/${_pkgname}"
license=('GPL3')
conflicts=("${_pkgname}")
providers=("${_pkgname}")
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_linux_x86_64.AppImage")
sha256sums=('efdaed9ad186dc64a6bdb5e5b9568fd77013559ff0ecd6654cfd0e528f03e1c5')
    
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/notesnook.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}