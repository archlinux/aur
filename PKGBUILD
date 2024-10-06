# Maintainer: Sich <little_sich@tuta.io>
# Contributor: Mr.Smith1974
_pkgname=celestia
_appimage="${_pkgname}-latest-x86_64.AppImage"
_desktopfile="space.celestiaproject.celestia.desktop"

pkgname=celestia-appimage
pkgver=1.7.0
pkgrel=1
pkgdesc="Real-time space simulation"
arch=(x86_64)
license=(GPL-2.0-or-later)
url="https://github.com/CelestiaProject/Celestia"
depends=()
options=(!strip)
source=("https://download.opensuse.org/repositories/home:/munix9:/unstable/AppImage/celestia-latest-x86_64.AppImage")
sha512sums=('bd0bc0b86e70a82c93970b4aa7896eb2eaf0b35c323ee9b4aaf4b8200893a42b88eae6f827fab4791e39aef78f2d83f539c9367664ee1369942e9ef58ad9b5b0')


prepare() {
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract usr/share/applications/${_desktopfile}
    ./${_appimage} --appimage-extract usr/share/pixmaps/${_pkgname}.png
}

package() {
    install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}" # Install $_appimage to /opt/$_pkgname/$_appimage
    install -d "${pkgdir}/usr/bin" # Install /usr/bin
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}" # Link /opt/$_pkgname/$_appimage to /usr/bin/$_pkgname
    
    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_desktopfile}" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/pixmaps/celestia.png" "${pkgdir}/usr/share/pixmaps/celestia.png"
}
