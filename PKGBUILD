pkgname=gaiasky-appimage
pkgver=3.5.7
versionstr=3.5.7-3.8be0b0add
_pkgname=gaiasky
_appimage="${_pkgname}_${pkgver}_x86_64.appimage"
pkgrel=1
pkgdesc="Open source 3D universe simulator for desktop and VR with support for more than a billion objects. Appimage version"
arch=(x86_64)
license=(MPL)
url="https://zah.uni-heidelberg.de/gaia/outreach/gaiasky"
depends=('java-runtime' 'xorg-xrandr')
source=("https://gaia.ari.uni-heidelberg.de/gaiasky/releases/latest/${_pkgname}_${versionstr}_x86_64.appimage")
sha256sums=('bddb8005ad6b6d3b86e7fe5e26b91ee1144cada04d410d3fb757c8cb39c80d7c')

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
