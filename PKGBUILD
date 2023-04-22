# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="podman-desktop-companion-appimage"
pkgver=4.1.0rc.28
_pkgver="rc.28"
pkgrel=3
pkgdesc="Cross-platform desktop integrated application with consistent UI,Learning tool for the powerful podman command line interface"
arch=("x86_64")
url="https://iongion.github.io/${pkgname%-appimage}/"
_githuburl="https://github.com/iongion/${pkgname%-appimage}"
license=('MIT')
depends=('hicolor-icon-theme' 'zlib' 'glibc')
provides=(iongion)
options=(!strip)
conflicts=("${pkgname%-appimage}")
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}-${_pkgver}/${pkgname%-appimage}-x86_64-${pkgver}-${_pkgver}.AppImage"
    "LICENSE::${_githuburl}/raw/main/LICENSE")
_install_path="/opt/appimages"
sha256sums=('ac6f996348ed3a02b64225ea4ead93092f9b721c534f9ba49797a0a1ae56aef9'
            'f4568243330d6dcbe6bd8a6d28f86c0b1916c695b3788b9ceee15fdfe9fcda9d')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/podman-desktop-companion.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/${pkgname%-appimage}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}