# Maintainer: xyzzy

pkgname=spotify-adblock-git
_pkgname=${pkgname%-*}
pkgver=1.0.0.r2.g990c0f2
pkgrel=1
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
	'69f497a0b869e855b7c6c733c73ee3f285000d56543bf5083382fe1957a9be9a27f8e7eff6e3ef5ccaf5c12ee7750c7e8561bef54e688e5b8b738b320f5cf90a'
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
