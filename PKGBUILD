_pkgname=lpub3d
_pkgver=2.4.7
_appimage="LPub3D-${_pkgver}.0.3476_20230621-x86_64.AppImage"
_desktopfile="${_pkgname}"

pkgname=lpub3d-appimage
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="LDraw™ editor for LEGO® style digital building instructions"
arch=(x86_64)
license=(GPL3)
url="https://trevorsandy.github.io/lpub3d"
depends=('fuse2')
conflicts=()
options=(!strip)
source=("${_appimage}::https://sourceforge.net/projects/${_pkgname}/files/${_pkgver}/${_appimage}/download")
sha256sums=('a2cc008c08e5b26be4c321a08bac46cdde0582c6764108823652bd4690ba8081')


prepare() {
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract ${_desktopfile}.desktop
    ./${_appimage} --appimage-extract usr/share/icons/hicolor/512x512/apps/${_desktopfile}.png
}

package() {
    install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}" # Install $_appimage to /opt/$_pkgname/$_appimage
    install -d "${pkgdir}/usr/bin" # Install /usr/bin
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}" # Link /opt/$_pkgname/$_appimage to /usr/bin/$_pkgname
    
    # Desktop file
    install -dm755 "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/${_desktopfile}.desktop" "${pkgdir}/usr/share/applications"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${_desktopfile}.png" "${pkgdir}/usr/share/pixmaps"
}

