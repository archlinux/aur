# Maintainer: Marco Wahls <marco.wahls@gmx.net>
# Contributor: Mr.Smith1974
_pkgname=lpub3d
_pkgver=2.4.8
_appimage="LPub3D-${_pkgver}.0.3723_20241019-x86_64.AppImage"
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
sha256sums=('f454fb6011dc0b97127d38d56af78a49d29d7fdca88570a38dd1c5a7c4d39aba')


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

