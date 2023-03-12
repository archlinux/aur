# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mockoon-appimage
_pkgname=mockoon
pkgver=1.23.0
pkgrel=1
pkgdesc="The easiest and quickest way to run mock APIs locally. No remote deployment, no account required, open source."
arch=('x86_64')
url="https://mockoon.com/"
_githuburl="https://github.com/mockoon/mockoon"
license=('MIT')
options=(!strip)
providers="${_pkgname}"
conflits=(mockoon-bin)
depends=(zlib hicolor-icon-theme)
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage")
sha256sums=('d5ecfe57a6d597292eff3af7a6e0da3f26be3fd09000a4cb305fc5db7cafa47d')
_install_path="/opt/appimages" 
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/mockoon.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
   
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
