_pkgname=eternallands
_pkgver=1.9.7.0
_appimage="EternalLands-Linux-x86_64_${_pkgver}.AppImage"
_desktopfile="com.eternal_lands.elc.desktop"

pkgname=eternallands-appimage
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="A free 3D MMORPG game with thousands of on-line players. Appimage version"
arch=(x86_64)
license=('custom')
url="http://eternal-lands.com/"
depends=()
options=(!strip)
source=("https://github.com/raduprv/Eternal-Lands/releases/download/${pkgver}-4/${_appimage}")
sha256sums=('12a4e54214c85a11fdbf7464319a63f43e0974f1300c9fa71f8a216f4113498b')


prepare() {
    chmod +x ${_appimage}
    ./${_appimage} --appimage-extract usr/share/applications/${_desktopfile}
    ./${_appimage} --appimage-extract usr/share/icons/hicolor/128x128/apps/${_pkgname}.png
}

package() {
    install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}" # Install $_appimage to /opt/$_pkgname/$_appimage
    install -d "${pkgdir}/usr/bin" # Install /usr/bin
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}" # Link /opt/$_pkgname/$_appimage to /usr/bin/$_pkgname
    
    # Desktop file
    install -dm755 "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_desktopfile}" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
