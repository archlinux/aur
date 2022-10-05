# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>

pkgname=americas-army-2.5
_pkgname=25Assist
pkgver=22.03.11
pkgrel=1
pkgdesc='A GUI client application for Downloading Installing and Playing Americas Army 2.5'
arch=('any')
groups=("games")
url="http://aao25.com/"
license=('EULA - ARMY GAME LICENSING AGREEMENT')
depends=('mesa' 'lib32-gtk2' 'lib32-libcanberra' 'lib32-gnome-themes-extra' 'lib32-gtk-engine-murrine')
source=("https://downloads.sourceforge.net/project/aa25assist/Binaries/25Assist-Linux.zip"
		"Americasarmy-logo.svg")
md5sums=('67aa89388ba92fb160ce98b8dc1f0af1'
	    'f56dd64907c29a5ec3cdf19484043c1c')

package() {
	mkdir -p "${pkgdir}/opt/${_pkgname}"

	msg2 "Extracting library archives..."
	cd "${pkgdir}" || exit
	unzip "${srcdir}/$_pkgname-Linux.zip" -d "${pkgdir}/opt/${_pkgname}"
	cp "${srcdir}/Americasarmy-logo.svg" "${pkgdir}/opt/${_pkgname}/$_pkgname.svg"

	msg2 "Creating launchers..."
	cd "${srcdir}" || exit
	cat > "${srcdir}/Americas Army.desktop" << EOF
[Desktop Entry]
Name=Americas Army
Comment=Game
Exec=/opt/${_pkgname}/$_pkgname
Icon=/opt/${_pkgname}/$_pkgname.svg
Terminal=false
Type=Application
Categories=Game
EOF

	install -Dm644 "${srcdir}/Americas Army.desktop" "${pkgdir}/usr/share/applications/Americas Army.desktop"

	msg2 "Done!"
}
