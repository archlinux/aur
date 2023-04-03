# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=fifo
pkgname="${_pkgname}-browser-appimage"
pkgver=1.2.2
pkgrel=1
pkgdesc="A modern web browser, built on top of modern web technologies such as Electron and React that is mean't to be secure."
arch=('x86_64')
url="https://fifo.snaildos.com/"
_githuburl="https://github.com/snaildos/Fifo-Browser"
license=('GPL3')
conflicts=("${_pkgname}")
providers=("snaildos")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Fifo-${pkgver}.AppImage")
sha256sums=('9bc6a3e4b31e3d21903e17dc35bc30f86e151e26760641aceac2475c99ea5f58')
    
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/fifo.AppImage/g;s/Browser;/Network;/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}