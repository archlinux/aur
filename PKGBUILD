pkgname=gaiasky-appimage
pkgver=3.4.2.041928e7c
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
sha256sums=('c7719d09fb22c2f442643aaa08316eff4cc538c0b7a2f850e6327bd9b3400bfa')


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
