# Maintainer: Yamashiro <dev cosmicheron com>
# Contributors: Frederic Bezies, Ronan Rabouin, carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname='yamagi-quake2-xatrix'
pkgver='2.17'
pkgrel='1'
arch=('i686' 'x86_64' 'aarch64')
pkgdesc="Quake II - Mission Pack 1 ('The Reckoning') for yamagi-quake2"
url='https://www.yamagi.org/quake2/'
license=('GPL-2.0-only')
depends=('bash' 'glibc' 'yamagi-quake2')
install="${pkgname}.install"
source=(
	"https://deponie.yamagi.org/quake2/${pkgname#*-}-${pkgver}.tar.xz"
	"${pkgname}.sh"
	"${pkgname}.desktop"
)
b2sums=(
	'91ab6bf55956d4eb517676eb17c73adda097dd9da891732bda5868647612fddda1b9d38a3eb63f411bf84a83ae256b2ebd230c6fb47c174acdbda25d895c52c6'
	'342c3ed0b79d9d155359688f4eecdc1e146620e0d671795376a52167d8d7a7a0a969cf4a6760588f405d0e84bd86cf66a843898f4ad3cb2cbfbd32da8018f56b'
	'ba6c2af8cfe5f9aff96d92561f6271496317cdf8dee7c5977a9374b996fd5763075c129cd3dccf96849bdeef793b8c9726a24dc4395bac740ef8682bc9f1d035'
)

build() {
	make -C "${pkgname#*-}-${pkgver}"
}

package() {
	cd "${pkgname#*-}-${pkgver}"

	# game library
	install -Dm644 -t "${pkgdir}/usr/lib/yamagi-quake2/xatrix" 'release/game.so'

	# game launcher
	install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	# doc
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'

	# desktop entry
	install -Dm644 -t "${pkgdir}/usr/share/applications" "../${pkgname}.desktop"
}
