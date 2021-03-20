# Maintainer: cong_hui <waylonvhui@gmail.com>

pkgname=badlionclient
_pkgname=BadlionClient
pkgver=3.1.1
pkgrel=1
pkgdesc="A minecraft pvp client"
arch=('x86_64')
url="https://www.badlion.net"
license=('unknown')
depends=()
options=(!strip)
_appimage="BadlionClient"
source_x86_64=("https://client-updates-cdn77.badlion.net/${_appimage}")
sha256sums_x86_64=('SKIP')
prepare() {
	chmod +x "${_appimage}"
	./"${_appimage}" --appimage-extract
}



package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"

    install -dm755 "${pkgdir}/usr/share/"
	cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
	echo "[Desktop Entry]
Name=Badlion Client
Exec=/opt/${pkgname}/${_pkgname}.AppImage %U
Terminal=false
Type=Application
Icon=/opt/${pkgname}/@badlionnative-desktop
StartupWMClass=Badlion Client
X-AppImage-Version=3.1.1
Comment=Badlion Client
Categories=Game;
" > "${srcdir}/${_pkgname}.desktop"

	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
    
}
