# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=podman-desktop-companion
pkgname="${_pkgname}-appimage"
pkgver=4.1.0
_pkgver="rc.28"
pkgrel=2
pkgdesc="Cross-platform desktop integrated application with consistent UI,Learning tool for the powerful podman command line interface"
arch=("x86_64")
url="https://iongion.github.io/${_pkgname}/"
_githuburl="https://github.com/iongion/${_pkgname}"
license=('MIT')
depends=(hicolor-icon-theme zlib glibc)
provides=(iongion)
options=(!strip)
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}-${_pkgver}/${_pkgname}-x86_64-${pkgver}-${_pkgver}.AppImage"
    "LICENSE::${_githuburl}/raw/main/LICENSE")
_install_path="/opt/appimages"
sha256sums=('ac6f996348ed3a02b64225ea4ead93092f9b721c534f9ba49797a0a1ae56aef9'
            'f4568243330d6dcbe6bd8a6d28f86c0b1916c695b3788b9ceee15fdfe9fcda9d')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=AppRun/Exec=\/opt\/appimages\/podman-desktop-companion.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}