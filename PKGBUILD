# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Yamashiro <dev cosmicheron com>

_pkgbase='yamagi-quake2-ctf'
pkgname="${_pkgbase}-git"
pkgver='1.13.r0.ga0d8b16'
pkgrel='1'
arch=('i686' 'x86_64')
pkgdesc='Quake II - Three Wave Capture The Flag for yamagi-quake2 (development version)'
url='https://www.yamagi.org/quake2/'
license=('GPL-2.0-only')
depends=('bash' 'glibc' 'yamagi-quake2')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=(
	"${_pkgbase}::git+https://github.com/yquake2/ctf.git"
	"${_pkgbase}.sh"
	"${_pkgbase}.desktop"
)
b2sums=(
	'SKIP'
	'b8052d3ffb3c3ae019b9133eed4efc13c13220d0f44081e3c5e7d19a6904005f22a2fb66be1b52d502e4459384898eb77eebe9fe7e8a152e2bfedea09e8a8019'
	'e982a00b16c4982aea0fd566632b5c4e2d0680059025b56a92d844795700b65d77a79c9506dee07a8ab537bee960b3307c29f72b464d72d8a34a9244a04e2d47'
)

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags | sed 's/^CTF_//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	make -C "$_pkgbase"
}

package() {
	cd "$_pkgbase"

	# game library
	install -Dm644 -t "${pkgdir}/usr/lib/yamagi-quake2/ctf" 'release/game.so'

	# game launcher
	install -Dm755 "../${_pkgbase}.sh" "${pkgdir}/usr/bin/${_pkgbase}"

	# doc
	install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}" 'README.md'

	# desktop entry
	install -Dm644 -t "${pkgdir}/usr/share/applications" "../${_pkgbase}.desktop"
}
