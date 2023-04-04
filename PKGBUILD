# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=losslesscut
pkgname="${_pkgname}-appimage"
pkgver=3.53.0
pkgrel=1
pkgdesc="The swiss army knife of lossless video/audio editing."
arch=('x86_64')
url="https://github.com/mifi/lossless-cut"
license=(GPL2)
options=(!strip)
providers=(mifi)
conflits=("${_pkgname}")
depends=(zlib hicolor-icon-theme glibc)
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/LosslessCut-linux-x86_64.AppImage")
sha256sums=('bd38706b6b4c5dd833c3b56f02607776e51666884210d7503811d7f476de2c04')
_install_path="/opt/appimages"
  
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/losslesscut.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
