
# Maintainer: C22 <c22 at equestrianinnovations dot eq>

_game_name="SnootGame"
_pkg_name="snoot-game"
pkgname="${_pkg_name}-bin"
pkgver=Update7_Fangsgiving
pkgrel=1
pkgdesc="Renpy visual novel parody of Goodbye Volcano High"
arch=('x86_64')
options=("!strip" "staticlibs")
url="https://snootgame.xyz"
license=("AGPL", "custom:CC-BY-SA 4.0")

source=("snoot_game.desktop" "https://secureupdates.snootgame.xyz/${_game_name}-${pkgver}-linux.tar.bz2")
b2sums=('775b24409efa19caf2c91904aa5ddaf8dda9232c384fdbd9767caa5e6458e7b5a3e8e890067d22deb081d363ecda3cbfe3fee7e090d6b1ba642b48d9a3681dda'
        '13d1603d2b8d2936b76b1289dddc507617bb574bab938ae6b00ca1ce0d9ba3fd32f87fc649eedbb4fe1c3c73e81632faa16bb02aae5175ae3c3a32843236aa0f')

package() {
	_install_path="/opt/${_pkg_name}"

	mkdir -p "${pkgdir}/${_install_path}"
	cp -ar "${srcdir}/${_game_name}-${pkgver}-linux"/* "${pkgdir}/${_install_path}"

	_licenses_dir="${pkgdir}/usr/share/licenses/${_pkg_name}"
	mkdir -p "${_licenses_dir}"
	ln -s "${_install_path}/LICENSE" "${_licenses_dir}"
	ln -s "${_install_path}/CC-BY-SA-4.0.txt" "${_licenses_dir}"
	ln -s "${_install_path}/GNU Affero General Public License Version Three.txt" "${_licenses_dir}"
	ln -s "${_install_path}/GPL-Exception" "${_licenses_dir}"

	mkdir -p "${pkgdir}/usr/share/pixmaps"
	ln -s "${_install_path}/game/gui/window_icon.png" "${pkgdir}/usr/share/pixmaps/${_pkg_name}.png"

	mkdir -p "${pkgdir}/usr/bin/"
	echo "#/bin/sh
cd ${_install_path}
./SnootGame.sh" > "${pkgdir}/usr/bin/${_pkg_name}"

	install -Dm755 "${srcdir}/snoot_game.desktop" "${pkgdir}/usr/share/applications/snoot_game.desktop"
}
