# Maintainer: Voylin <voylinslife@gmail.com>

pkgname=gozen-bin
pkgver=0.4.0
pkgrel=2
pkgdesc="A minimalistic video editor (binary AppImage release)"
arch=('x86_64')
url="https://github.com/VoylinsGamedevJourney/GoZen"
license=('GPL3')
provides=('gozen')
conflicts=('gozen' 'gozen-git')

# Adjust this to match the current release file
_appimage="gozen-v${pkgver}-alpha-x86_64.AppImage"

source=(
  "${_appimage}::https://github.com/VoylinsGamedevJourney/GoZen/releases/download/v${pkgver}-alpha/${_appimage}"
)
sha256sums=('071390478e29bf37283fc130c82e9a0a54bad94ef39081dbab8510b625614600')

package() {
	install -d "${pkgdir}/opt/${pkgname}"
	install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/gozen.AppImage"

	# Symlink into PATH
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/gozen.AppImage" "${pkgdir}/usr/bin/gozen"


	# Make a different desktop file for the -git build.
	sed -i 's/^Name=GoZen$/Name=GoZen-bin/' assets/linux/gozen.desktop
	sed -i "s/^Exec=gozen$/Exec=${pkgname}/" assets/linux/gozen.desktop
	sed -i "s/^Icon=gozen$/Icon=${pkgname}/" assets/linux/gozen.desktop

	# Desktop integration (optional, if your repo includes .desktop and icons)
	install -Dm644 "assets/linux/gozen.desktop" "${pkgdir}/usr/share/applications/gozen.desktop"
	install -Dm644 "assets/linux/gozen.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/gozen.png"
	install -Dm644 "assets/linux/gozen.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gozen.svg"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

