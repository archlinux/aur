# Maintainer: grufo <madmurphy333@gmail.com>

pkgname=popcorntime-ce
_pkgfamily=popcorntime
pkgver=0.4.0
pkgrel=2
pkgdesc="Stream movies from torrents. Skip the downloads. Launch, click, watch. Repos of the original community edition."
arch=("x86_64" "i686")
url="http://popcorntime.ag/"
license=('GPL3')
depends=('libnotify' 'desktop-file-utils' 'ttf-font' 'gconf' 'nss' 'libxtst' 'gtk2' 'alsa-lib')
optdepends=('net-tools: necessary for the new vpn feature' 'ttf-liberation: open source ttf fonts')
provides=('popcorntime')
conflicts=('popcorntime' 'popcorntime-bin' 'popcorntime-git')
options=('!strip')
install="popcorntime-ce.install"
sha1sums=('ee6a1b9314cbcb8eeabe76e9d6928f8c0bee4f42'
	'48fe37180e9dfed60da82fc67d023b0004f3f1c7'
	'bf7c94bef131003ea940c78d053c536433e34cf5')

_platform='64bit'

if [ "$CARCH" = 'i686' ]; then
	_platform='32bit'
	sha1sums[0]='369da992f097e1b872a0f7d00a62361ac9192c93'
fi

source=("https://github.com/PopcornTime-CE/desktop/releases/download/v${pkgver}-${pkgrel}/popcorn-time-community-v${pkgver}-${pkgrel}-${_platform}.tar.xz"
	"popcorntime-ce.install"
	"popcorntime-ce.desktop")

package() {

	cd "${srcdir}"

	install -dm755 "${pkgdir}/usr/share/${_pkgfamily}"
	install -dm755 "${pkgdir}/usr/bin"

	# Program
	install -Dm755 "${srcdir}/Popcorn-Time" "${pkgdir}/usr/share/${_pkgfamily}/"
	install -Dm644 "${srcdir}/"{icudtl.dat,libffmpegsumo.so,nw.pak,package.json} \
	"${pkgdir}/usr/share/${_pkgfamily}/"

	# Directories
	cp -a "${srcdir}/"{node_modules,src} "${pkgdir}/usr/share/${_pkgfamily}/"

	# Link to program
	ln -s "/usr/share/${_pkgfamily}/Popcorn-Time" "${pkgdir}/usr/bin/${_pkgfamily}"

	# Desktop file
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgfamily}.desktop"

	# Icon
	install -Dm644 "${srcdir}/${_pkgfamily}.png" "${pkgdir}/usr/share/pixmaps/${_pkgfamily}.png"

}

