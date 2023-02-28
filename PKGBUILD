# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tockler-appimage
_pkgname=tockler
pkgver=3.21.12
pkgrel=1
pkgdesc="An application that tracks your time by monitoring your active window title and idle time."
arch=('x86_64')
url="https://tockler.io/"
_githuburl="https://github.com/MayGo/tockler"
license=('GPL2')
options=(!strip)
conflicts=()
depends=('zlib' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Tockler-${pkgver}.AppImage")
sha512sums=('d7362a279c2e0b75e99901b9e1a88f297649a38ad762e46ad3ae4fac10a272ccd1c17e4fc37f155f8d251efd2c8e4dac8b1bbc64d40354274cac144a572b2084')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/tockler.AppImage" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for i in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
