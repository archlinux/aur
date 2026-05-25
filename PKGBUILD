# Maintainer: Yamashiro <dev cosmicheron com>
# Contributors: Frederic Bezies, Ronan Rabouin, carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname='yamagi-quake2-ctf'
pkgver='1.13'
pkgrel='1'
arch=('i686' 'x86_64' 'aarch64')
pkgdesc='Quake II - Three Wave Capture The Flag for yamagi-quake2'
url='https://www.yamagi.org/quake2/'
license=('GPL-2.0-only')
depends=('bash' 'glibc' 'yamagi-quake2')
source=(
	"https://deponie.yamagi.org/quake2/${pkgname#*-}-$pkgver.tar.xz"
	"$pkgname.sh"
	"$pkgname.desktop")
b2sums=(
	'824c60d959aa35da62bd5f2ece4345d70de0df2854ca34dc5756bbad833aaea6de81408811510fa8f9dfe49e097de2474b1895a3d413ba82cef58ba5b2c6fec7'
	'b8052d3ffb3c3ae019b9133eed4efc13c13220d0f44081e3c5e7d19a6904005f22a2fb66be1b52d502e4459384898eb77eebe9fe7e8a152e2bfedea09e8a8019'
	'e982a00b16c4982aea0fd566632b5c4e2d0680059025b56a92d844795700b65d77a79c9506dee07a8ab537bee960b3307c29f72b464d72d8a34a9244a04e2d47'
)

build() {
	make -C ${pkgname#*-}-$pkgver
}

package() {
	cd "${pkgname#*-}-${pkgver}"

	# game library
	install -Dm644 -t "${pkgdir}/usr/lib/yamagi-quake2/ctf" 'release/game.so'

	# game launcher
	install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	# doc
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'

	# desktop entry
	install -Dm644 -t "${pkgdir}/usr/share/applications" "../${pkgname}.desktop"
}
