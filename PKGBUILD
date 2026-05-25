# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Yamashiro <dev cosmicheron com>

_pkgbase='yamagi-quake2-rogue'
pkgname="${_pkgbase}-git"
pkgver='2.16.r9.g9b2ee61'
pkgrel='1'
arch=('i686' 'x86_64' 'aarch64')
pkgdesc="Quake II - Mission Pack 2 ('Ground Zero') for yamagi-quake2 (development version)"
url='https://www.yamagi.org/quake2/'
license=('GPL-2.0-only')
depends=('bash' 'glibc' 'yamagi-quake2')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
install="${_pkgbase}.install"
source=(
	"${_pkgbase}::git+https://github.com/yquake2/rogue.git"
	"${_pkgbase}.sh"
	"${_pkgbase}.desktop"
)
b2sums=(
	'SKIP'
	'e03863efd92b71b43050f416a3b5059809caf7d32f22c15fb5703faa11e669909c066c8911066aad915d7a144e5bc946b0c7b94746eba76a17254c643332b7fe'
	'd80b2328eb85a5461205eebbda04b357e42996f026a1f3cd52fe04066775bed5b73990e6956c164f96d63696c5961ad5ed03e4a9eeb1000a69e60c74aa888c65'
)

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags | sed 's/^ROGUE_//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	make -C "$_pkgbase"
}

package() {
	cd "$_pkgbase"

	# game library
	install -Dm644 -t "${pkgdir}/usr/lib/yamagi-quake2/rogue" 'release/game.so'

	# game launcher
	install -Dm755 "../${_pkgbase}.sh" "${pkgdir}/usr/bin/${_pkgbase}"

	# doc
	install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}" 'README.md'

	# desktop entry
	install -Dm644 -t "${pkgdir}/usr/share/applications" "../${_pkgbase}.desktop"
}
