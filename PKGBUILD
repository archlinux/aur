pkgname=gaiasky-appimage
pkgver=3.5.3.d076b1659
_pkgname=gaiasky
_appimage="${_pkgname}_${pkgver}_x86_64.appimage"
pkgrel=1
pkgdesc="Open source 3D universe simulator for desktop and VR with support for more than a billion objects. Appimage version"
arch=(x86_64)
license=(MPL)
url="https://zah.uni-heidelberg.de/gaia/outreach/gaiasky"
depends=()
options=()
source=(https://gaia.ari.uni-heidelberg.de/gaiasky/releases/latest/${_pkgname}_${pkgver}_x86_64.appimage)
sha256sums=('271c7785df8082f72afa36978dac446aa5d138c010ffaf3adf30fdcbbaf40f99')


prepare() {
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract ${_pkgname}.desktop
    ./${_appimage} --appimage-extract gs_icon.png
}

package() {
    install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}" # Install $_appimage to /opt/$_pkgname/$_appimage
    install -d "${pkgdir}/usr/bin" # Install /usr/bin
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}" # Link /opt/$_pkgname/$_appimage to /usr/bin/$_pkgname
    
    # Install desktop entry and icon
    install -Dpm644 "squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
