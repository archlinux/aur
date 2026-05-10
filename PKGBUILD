# Maintainer: Voylin <voylinslife@gmail.com>

pkgname=gozen-bin
pkgver=0.9.4
pkgrel=1
pkgdesc="A minimalistic video editor (binary AppImage release)"
arch=('x86_64')
url="https://github.com/VoylinsGamedevJourney/GoZen"
license=('GPL3')
provides=('gozen')
conflicts=('gozen' 'gozen-git')
options=(!strip)

# Adjust this to match the current release file
_appimage="gozen-v${pkgver}-alpha-x86_64.AppImage"

source=(
  "${_appimage}::https://github.com/VoylinsGamedevJourney/GoZen/releases/download/v${pkgver}-alpha/${_appimage}"
  "gozen-bin.desktop::https://raw.githubusercontent.com/VoylinsGamedevJourney/gozen/refs/heads/master/assets/linux/gozen.desktop"
  "gozen.png::https://raw.githubusercontent.com/VoylinsGamedevJourney/gozen/master/assets/linux/gozen.png"
  "gozen.svg::https://raw.githubusercontent.com/VoylinsGamedevJourney/gozen/master/assets/linux/gozen.svg"
  "LICENSE::https://raw.githubusercontent.com/VoylinsGamedevJourney/gozen/refs/heads/master/LICENSE"
)
sha256sums=('6c09b46dacb9c4b88e6abfa57bfa51cf291fc25bebba91b3b97098a089fbdaab'
            '06235c34b7db3df316bb3c0e18fa55edbb75a0b1444235913fdeb2aff4c20730'
            '1879e13f6fa093f9fb1786466f3bc0bc1465d31392bc668b3c1216c63f7e8c36'
            '3830395131c87f0b8b8b3ab7483fdc8e4212a51ff3a7a038ef208027a9c06946'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
	install -d "${pkgdir}/opt/${pkgname}"
	install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/gozen-bin.AppImage"

	# Symlink into PATH
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/gozen-bin.AppImage" "${pkgdir}/usr/bin/gozen-bin"

	# Make a different desktop file for the -git build.
	sed -i 's/^Name=GoZen$/Name=GoZen-bin/' gozen-bin.desktop
	sed -i "s/^Exec=gozen$/Exec=${pkgname}/" gozen-bin.desktop
	sed -i "s/^Icon=gozen$/Icon=${pkgname}/" gozen-bin.desktop

	# Desktop integration (optional, if your repo includes .desktop and icons)
	install -Dm644 "gozen-bin.desktop" "${pkgdir}/usr/share/applications/gozen-bin.desktop"
	install -Dm644 "gozen.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/gozen.png"
	install -Dm644 "gozen.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gozen.svg"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

