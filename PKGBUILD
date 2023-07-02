_pkgname=celestia
_pkgver=1.6.3
_appimage="${_pkgname}-${_pkgver}-lp154.2.1.Build2.2.glibc2.29-x86_64.AppImage"
_desktopfile="space.celestia.celestia.desktop"

pkgname=celestia-appimage
pkgver=1.6.3
pkgrel=2
pkgdesc="Real-time space simulation"
arch=(x86_64)
license=(GPL)
url="https://github.com/CelestiaProject/Celestia"
depends=('gtk2')
options=(!strip)
source=("https://github.com/CelestiaProject/Celestia/releases/download/${pkgver}/${_pkgname}-${pkgver}-lp154.2.1.Build2.2.glibc2.29-x86_64.AppImage")
sha256sums=('7c3c586d4e9e8e91c7d660a5312e95fd80600c482b84dadfa13f81bfc907f8ef')


prepare() {
    chmod +x ${_appimage}
    #./${_appimage} --appimage-extract
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
