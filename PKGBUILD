# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>

pkgname=americas-army-2.5
_pkgname=25Assist
pkgver=8.21
pkgrel=0
pkgdesc='A GUI client application for Downloading Installing and Playing Americas Army 2.5'
arch=('any')
groups=("games")
url="http://aao25.com/"
license=('EULA - ARMY GAME LICENSING AGREEMENT')
depends=('mesa')
source=("https://downloads.sourceforge.net/project/aa25assist/Binaries/25Assist-Linux.zip"
	"https://www.americasarmy.com/images/logos/aapg-logo-small.svg")
sha256sums=('7dfadbb114af300491a5e55b12b84cc53fff10f7d59eab61090eadb09961b0be'
	    'bfa2c3dcb3f0e0d1ec242792b0e4232cffef86df4540435a01b28de12741eed4')

package() {
	msg2 "Extracting library archives..."
	cd "${pkgdir}" || exit
	unzip $_pkgname-Linux.zip -d "${pkgdir}/opt/${_pkgname}"
	cp aapg-logo-small.svg "${pkgdir}/opt/${_pkgname}/$_pkgname.svg"

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
	install -D -m644 $_pkgname.svg "${pkgdir}/opt/${_pkgname}.png"

	msg2 "Done!"
}
