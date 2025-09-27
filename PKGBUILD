
# Maintainer: C22 <c22 at equestrianinnovations dot eq>

_game_name="SnootGame"
_pkg_name="snoot-game"
_game_ver=Patch13-ChbabMaeMeung
pkgname="${_pkg_name}-bin"
pkgver=Patch13
pkgrel=1
pkgdesc="Renpy visual novel parody of Goodbye Volcano High"
arch=('x86_64')
options=("!strip" "!debug")
url="https://snootgame.xyz"
license=("AGPL", "custom:CC-BY-SA 4.0")

source=("snoot_game.desktop" "https://snootgame.xyz/bin/${_game_name}-${_game_ver}-linux.tar.bz2")
b2sums=('aee213241c80bf784935c802202898338065ff41b83f27e1bcea10b2cd314ce86d91a5c2c75a33c1c2e7e10f8dabfbc2ffe48b6f7bf2cf84bbcecd0726a2eda2'
        '45755e4d4611c2e50082712fa4d4faf042a761a82f6ef14e8cfc68308f312eb8dd3fab287491e6cac68619e15ccfb9302c0fed82d8d959a5e8603f3910915dcb')

package() {
	_install_path="/opt/${_pkg_name}"

	mkdir -p "${pkgdir}/${_install_path}"
	cp -ar "${srcdir}/${_game_name}-${_game_ver}-linux"/* "${pkgdir}/${_install_path}"

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
./${_game_name}.sh" > "${pkgdir}/usr/bin/${_pkg_name}"
	chmod +x "${pkgdir}/usr/bin/${_pkg_name}"

	install -Dm755 "${srcdir}/snoot_game.desktop" "${pkgdir}/usr/share/applications/snoot_game.desktop"
}
