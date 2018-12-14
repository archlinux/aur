# Maintainer: xyzzy <628208@gmail.com>

pkgname=spotify-adblock-git
_pkgname=${pkgname%-*}
pkgver=r2.ab860ef
pkgrel=1
license=("GPL3")
pkgdesc="Adblocker for Spotify"
depends=("spotify")
makedepends=("git")
arch=("i686" "x86_64")
provides=("spotify-adblock")
conflicts=("spotify-adblock")
url=https://github.com/abba23/spotify-adblock-linux
source=(
 "${_pkgname}::git+https://github.com/abba23/spotify-adblock-linux.git"
 "${_pkgname}.desktop")
 
sha1sums=(
	'SKIP'
	'5240cf66c7a74c2d3733cf858c9cd78e033950a5')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd ${srcdir}
	install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm755 "${_pkgname}/${_pkgname}.so" "${pkgdir}/usr/lib/${_pkgname}.so"
}
