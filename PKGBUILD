# Maintainer: Sich <little_sich@tuta.io>
# Contributor: Mr.Smith1974
_pkgname=celestia
_appimage="${_pkgname}-latest-x86_64.AppImage"
_desktopfile="space.celestiaproject.celestia.desktop"

pkgname=celestia-appimage
pkgver=1.7.0
pkgrel=2
pkgdesc="Real-time space simulation"
arch=(x86_64)
license=(GPL-2.0-or-later)
url="https://github.com/CelestiaProject/Celestia"
depends=()
options=(!strip)
source=("https://download.opensuse.org/repositories/home:/munix9:/unstable/AppImage/celestia-latest-x86_64.AppImage")
sha512sums=('e1fcbb6f49d86ff8c089753af887b3dff3c63eb2e98c57dd3de7e057193ef53d63fe50367ad9c584fcceac81796546c64dd02f2a16f398528c4d219c4b1161ec')


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
