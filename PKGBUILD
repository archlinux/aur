# Maintainer: Marco Wahls <marco.wahls@gmx.net>
# Contributor: Mr.Smith1974
_pkgname=lpub3d
_pkgver=2.4.9
_appimage="LPub3D-${_pkgver}.0.4047_20250109-x86_64.AppImage"
_desktopfile="${_pkgname}"

pkgname=lpub3d-appimage
pkgver="${_pkgver}"
pkgrel=1
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
source=("${_appimage}::https://github.com/trevorsandy/lpub3d/releases/download/v${_pkgver}/${_appimage}")
sha512sums=('60a71a47a84251208c874030d3b6fdbcadbee8f6bf13205b4949b7f44b1449d00e27dde0a272c8411b94009d368d5aaa86a53a6dfdca9f4d0424e4c336cb37b9')


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

