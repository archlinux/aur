# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=deltachat-desktop
pkgname="${_pkgname}-appimage"
pkgver=1.34.4
pkgrel=1
pkgdesc="Email-based instant messaging for Desktop."
arch=('x86_64')
url="https://github.com/deltachat/deltachat-desktop"
license=('GPL3')
providers=(deltachat)
conflits=("${_pkgname}")
depends=(hicolor-icon-theme zlib glibc)
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/DeltaChat-${pkgver}.AppImage")
_install_path="/opt/appimages"
sha256sums=('44c57b1e7edbb0e15b482e99d801cc1c3e8a8eefac32ecb5adac7ec186ece89c')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=AppRun/Exec=\/opt\/appimages\/deltachat-desktop.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
