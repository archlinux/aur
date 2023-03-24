# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=turbowarp-desktop
pkgname="${_pkgname}-appimage"
pkgver=1.7.2
_ver="beta.1"
pkgrel=1
pkgdesc="A program that lets you manipulate digital audio waveforms"
arch=("x86_64")
url="https://desktop.turbowarp.org/"
_githuburl="https://github.com/TurboWarp/desktop"
license=(GPL3)
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
conflicts=("${_pkgname}-bin")
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}-${_ver}/TurboWarp-linux-x86_64-${pkgver}-${_ver}.AppImage")
sha256sums=('5ce20252583bc0138cd1dd4ef0c8f59f2b72b41e105f2102f460a7a1f5d84564')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=AppRun/Exec=\/opt\/appimages\/turbowarp-desktop.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}