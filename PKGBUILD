pkgname=celestia-appimage
pkgver=1.6.3
_pkgname=celestia
_appimage="${_pkgname}-${pkgver}-lp154.2.1.Build2.2.glibc2.29-x86_64.AppImage"
_desktopfile="space.celestia.celestia"
pkgrel=1
pkgdesc="Real-time space simulation"
arch=(x86_64)
license=(GPL)
url="https://github.com/CelestiaProject/Celestia"
depends=('gtkglext' 'luajit')
options=()
source=(https://github.com/CelestiaProject/Celestia/releases/download/${pkgver}/${_pkgname}-${pkgver}-lp154.2.1.Build2.2.glibc2.29-x86_64.AppImage)
sha256sums=('7c3c586d4e9e8e91c7d660a5312e95fd80600c482b84dadfa13f81bfc907f8ef')


prepare() {
    ls -lah
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract ${_desktopfile}.desktop
    ./${_appimage} --appimage-extract ${_pkgname}.png
    ./${_appimage} --appimage-extract usr/share/icons
}

package() {
    install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}" # Install $_appimage to /opt/$_pkgname/$_appimage
    install -d "${pkgdir}/usr/bin" # Install /usr/bin
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}" # Link /opt/$_pkgname/$_appimage to /usr/bin/$_pkgname
    
    # Install desktop entry and icon
    install -Dpm644 "squashfs-root/${_desktopfile}.desktop" "${pkgdir}/usr/share/applications/${_desktopfile}.desktop"
}
