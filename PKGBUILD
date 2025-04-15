# Maintainer: Marco Wahls <marco.wahls@gmx.net>
# Contributor: Mr.Smith1974
_pkgname=lpub3d
_pkgver=2.4.9
_appimage="LPub3D-${_pkgver}.86.4133_20250319-x86_64.AppImage"
_desktopfile="${_pkgname}"

pkgname=lpub3d-appimage
pkgver="${_pkgver}"
pkgrel=4
pkgdesc="LDraw™ editor for LEGO® style digital building instructions"
arch=('x86_64')
license=('GPL3')
url="https://trevorsandy.github.io/lpub3d"
depends=('fuse2')
provides=('lpub3d')
optdepends=('ldraw-parts-library: LEGO parts library'
	    'leocad: A CAD program for creating virtual LEGO models')
conflicts=()
options=(!strip)
source=("${_appimage}::https://github.com/trevorsandy/lpub3d/releases/download/continuous/${_appimage}")
sha512sums=('e82e1bc4e0a19c6aea97ba8cb07c02fef47ef32bc321727e1f65a4449c566ce9248ee75971ead89f20542fac032c4f73564c7166517ce5ad688e27894cb2476f')


prepare() {
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract ${_desktopfile}.desktop
    ./${_appimage} --appimage-extract ${_desktopfile}.png
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

