# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=podman-desktop-companion-appimage
_pkgname=podman-desktop-companion
pkgver=4.1.0
_pkgver="rc.28"
pkgrel=1
pkgdesc="Cross-platform desktop integrated application with consistent UI,Learning tool for the powerful podman command line interface"
arch=("x86_64")
url="https://iongion.github.io/podman-desktop-companion/"
_githuburl="https://github.com/iongion/podman-desktop-companion"
license=('MIT')
depends=(hicolor-icon-theme zlib)
provides=()
options=(!strip)
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}-${_pkgver}/${_pkgname}-x86_64-${pkgver}-${_pkgver}.AppImage")
_install_path="/opt/appimages"
sha256sums=('ac6f996348ed3a02b64225ea4ead93092f9b721c534f9ba49797a0a1ae56aef9')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=AppRun/\#Exec=AppRun/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=${_install_path}/${_pkgname}.AppImage" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
