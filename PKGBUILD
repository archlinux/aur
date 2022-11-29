# Maintainer: xyzzy

pkgname=spotify-adblock-git
_pkgname=${pkgname%-*}
pkgver=1.0.2.r0.g9ba383b
pkgrel=2
epoch=1
license=("GPL3")
pkgdesc="Adblocker for Spotify"
depends=("spotify")
makedepends=("git" "rust")
arch=("x86_64")
provides=("spotify-adblock")
conflicts=("spotify-adblock")
url=https://github.com/abba23/spotify-adblock

backup=("etc/spotify-adblock/config.toml")

source=(
	"${_pkgname}::git+${url}.git"
	"${_pkgname}.desktop"
)

sha512sums=(
	'SKIP'
	'cc6569af907a462859f51fd75545535fc6e990c250d0d336aeffbafc7b46cb7e28310393ba856d6170cedfd0e070042033556f49fe5f34f847f2eb64bc4fd6b5'
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
	install -D --mode=644 "../${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
