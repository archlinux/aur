# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=freac-appimage
_appname="org.${pkgname%-appimage}.${pkgname%-appimage}"
pkgver=1.1.7
pkgrel=7
pkgdesc="Audio converter and CD ripper with support for various popular formats and encoders."
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://www.freac.org/"
_ghurl="https://github.com/enzo1982/freac"
license=('GPL2')
conflicts=("${pkgname%-appimage}")
provides=("${pkgname%-appimage}=${pkgver}")
depends=()
makedepends=(
    'squashfuse'
)
options=('!strip')
_install_path="/opt/appimages/"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-linux-aarch64.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-linux-armhf.AppImage")
source_i686=("${pkgname%-appimage}-${pkgver}-i686.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-linux-i686.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-linux-x86_64.AppImage")
sha256sums_aarch64=('027a53acf9c083edaada7d9225d6b75b69020a8beec0b99e65e950a19716e37e')
sha256sums_armv7h=('935a12b6c2b5113d6560c297ab6eceb8963d24b31020e1c7766f4095a08075a0')
sha256sums_i686=('76db7d56f61c282f63d3ef80dfd7f5be690ccecf724f5e730a336930629dc4c8')
sha256sums_x86_64=('17d5d8ee6c3a0498e1639d002ff64ee557fe3c9f4b347996107d8755ea91f2d6')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|${_appname}|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/usr/share/applications/${_appname}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
}