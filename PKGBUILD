# Maintainer: Timothée Andres <andres.timothee+aur@gmail.com>
# Contributor: MCMic <come@chilliet.eu>

_srcurl="$(curl -fLsX POST "https://madgarden.itch.io/eggnogg/file/138869" | grep -Po '"url":.*?[^\\]"' | sed 's/\\\//\//g' | cut -d '"' -f 4 -)"

pkgname=eggnogg+
pkgver=20151221
pkgrel=3
pkgdesc="A competitive arcade game of immortals sword-fighting to the death"
arch=('x86_64')
url="https://madgarden.itch.io/eggnogg"
license=(unknown)
depends=('sdl2-compat' 'glibc' 'hicolor-icon-theme' 'bash' 'libglvnd')
source=(
	"eggnoggplus-${pkgver}.zip::$_srcurl"
	'http://madgarden.net/junkz/madgarden/eggnogg/icon-1.png'
	'local://eggnogg+.desktop'
)
sha256sums=('53fac8184678877085af51d169686d866f679b21a14d59115dbc3c33f3d177e3'
            '0491f5297261b77cc097d75bc2afa3f68b351cc51c76b0acfc587d45a523e6ed'
            'cfcd3d495b96883acaeb6261b6f21cdb24d9e31b61efe1d5a95fc8409dbff868')

_name='EGGNOGG+'
_categories='Game;ArcadeGame'

package() {
	cd "${srcdir}/eggnoggplus-linux"
	mkdir -p "${pkgdir}/usr/share/games/${pkgname}"
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	cp "${srcdir}/icon-1.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
	cp -a eggnoggplus data README.txt "${pkgdir}/usr/share/games/${pkgname}/"
	# The game needs to be launched from the data parent directory and it needs write access to this folder
	echo -e "#!/bin/sh\ncd /usr/share/games/${pkgname}\n./eggnoggplus" > "${pkgdir}/usr/bin/${pkgname}"
	chmod +x "${pkgdir}/usr/bin/${pkgname}"
}
