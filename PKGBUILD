# Maintainer: grufo <madmurphy333@gmail.com>

pkgname="popcorntime-ce-bin"
_pkgname="popcorntime-ce"
pkgver="0.4.0"
pkgrel="2"
pkgdesc="Stream movies from torrents. Skip the downloads. Launch, click, watch. Repos of the original community edition."
arch=("x86_64" "i686")
url="http://popcorntime.ag/"
license=("GPL3")
depends=("alsa-lib" "desktop-file-utils" "gconf" "gtk2" "libnotify" "libxtst" "nodejs" "nss" "python" "ttf-font")
optdepends=("net-tools: necessary for the new vpn feature" "ttf-liberation: open source ttf fonts")
provides=("popcorntime" "popcorntime-ce")
conflicts=("popcorntime-ce" "popcorntime-ce-git")
options=("!strip")
install="popcorntime-ce.install"

sha1sums=("ee6a1b9314cbcb8eeabe76e9d6928f8c0bee4f42"
	"2c22a3f1d1335abe8d7ac7dd6a33933720ba30e4"
	"219a9c7033361e1286967452868721302b1d6da7")

_platform="64bit"

if [ "$CARCH" = "i686" ]; then
	_platform="32bit"
	sha1sums[0]="369da992f097e1b872a0f7d00a62361ac9192c93"
fi

source=("https://github.com/PopcornTime-CE/desktop/releases/download/v${pkgver}-${pkgrel}/popcorn-time-community-v${pkgver}-${pkgrel}-${_platform}.tar.xz"
	"popcorntime-ce.install"
	"popcorntime-ce.desktop")


package() {

	cd "${srcdir}"

	install -dm755 "${pkgdir}/usr/share/${_pkgname}"
	install -dm755 "${pkgdir}/usr/bin"

	# Program
	install -Dm755 "${srcdir}/Popcorn-Time" "${pkgdir}/usr/share/${_pkgname}/Popcorn-Time-CE"
	install -Dm644 "${srcdir}/"{CHANGELOG.md,icudtl.dat,libffmpegsumo.so,LICENSE.txt,nw.pak,package.json,README.md} "${pkgdir}/usr/share/${_pkgname}/"

	# Directories
	cp -a "${srcdir}/"{node_modules,src} "${pkgdir}/usr/share/${_pkgname}/"

	# Link to program
	ln -s "/usr/share/${_pkgname}/Popcorn-Time-CE" "${pkgdir}/usr/bin/${_pkgname}"

	# Desktop file
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# Icon
	install -Dm644 "${srcdir}/src/app/images/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

}

