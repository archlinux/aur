# Maintainer: Jan Claussen <jan dot claussen10 at web dot de>
pkgname=totk-mod-manager-bin
_pkgname=totk-mod-manager
pkgver=0.9.7
pkgrel=1
pkgdesc="Open-source application, designed to assist players of Zelda: Tears of the Kingdom on the Yuzu emulator in managing mods for the game"
arch=(x86_64)
url="https://github.com/vasilvestre/totk-mod-manager-for-switch-emulators"
license=('BSD-3-Clause')
options=(!strip)
provides=("totk-mod-manager")
replaces=("totk-mod-manager" "totk-mod-manager-git")
source_x86_64=( 
	"totk-mod-manager.png"
	"totk-mod-manager.desktop"
	"${_pkgname}-${pkgver}.AppImage::https://github.com/vasilvestre/totk-mod-manager-for-switch-emulators/releases/download/v${pkgver}/zelda-tears-of-the-kingdom-mod-manager_0.9.6_amd64.AppImage"
)

noextract=("${_pkgname}-${pkgver}.AppImage")

sha256sums_x86_64=( 
	'eca0aa1c8b7a1bb72402180b0dd0e5ab2322d789df2f4af9496d5ea575a95e3d'
	'667479ef06a84e67228b366532b9857877e5b60b7ecd282994c90260acd413d2'
	'6d80d8ddcb94102ec187e35cc8043bcdbdf0d5a1d57e26db938128cc00042483' 
)

package() {

	# Install AppImage
	install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

	# Symlink executable
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

	# Install icon
	mkdir -p "${pkgdir}/usr/share/pixmaps/"
	install -m 644 "${srcdir}/totk-mod-manager.png" "${pkgdir}/usr/share/pixmaps/"

	# Install desktop file
	echo "install totk-mod-manager.desktop"
	mkdir -p "${pkgdir}/usr/share/applications/"
	install -m 664 "${srcdir}/totk-mod-manager.desktop" "${pkgdir}/usr/share/applications/"
}
