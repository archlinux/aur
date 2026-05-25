# Maintainer: Yamashiro <dev cosmicheron com>
# Contributors: Frederic Bezies, Ronan Rabouin, carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname='yamagi-quake2-rogue'
pkgver='2.16'
pkgrel='1'
arch=('i686' 'x86_64' 'aarch64')
pkgdesc="Quake II - Mission Pack 2 ('Ground Zero') for yamagi-quake2"
url='https://www.yamagi.org/quake2/'
license=('GPL-2.0-only')
depends=('bash' 'glibc' 'yamagi-quake2')
install="${pkgname}.install"
source=(
	"https://deponie.yamagi.org/quake2/${pkgname#*-}-${pkgver}.tar.xz"
	"${pkgname}.sh"
	"${pkgname}.desktop")
b2sums=(
	'f4a89df1f85bdcf5a38eb9a72d0666a4c1483ceab9cde0d278483f29a499428e1e4e7d8379fd76d4ff751de18ee773a34899be2bf812f3d0482c67b143b867ec'
	'e03863efd92b71b43050f416a3b5059809caf7d32f22c15fb5703faa11e669909c066c8911066aad915d7a144e5bc946b0c7b94746eba76a17254c643332b7fe'
	'd80b2328eb85a5461205eebbda04b357e42996f026a1f3cd52fe04066775bed5b73990e6956c164f96d63696c5961ad5ed03e4a9eeb1000a69e60c74aa888c65'
)

build() {
	make -C "${pkgname#*-}-${pkgver}"
}

package() {
	cd "${pkgname#*-}-${pkgver}"

	# game library
	install -Dm644 -t "${pkgdir}/usr/lib/yamagi-quake2/rogue" 'release/game.so'

	# game launcher
	install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	# doc
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'

	# desktop entry
	install -Dm644 -t "${pkgdir}/usr/share/applications" "../${pkgname}.desktop"
}
