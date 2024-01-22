# Maintainer: Brodi <me@brodi.space>
# Maintainer: Zeioth <zeioth@hotmail.com>
_pkgname=wofi-emoji
pkgname=${_pkgname}-git
pkgver=0.r11
pkgrel=2
pkgdesc="Emoji picker for Wayland using wofi and wtype"
arch=("any")
url="https://github.com/Zeioth/wofi-emoji"
license=("MIT")
depends=("wofi" "wtype" "wl-clipboard") # thanks to gilbs https://aur.archlinux.org/account/gilbs
makedepends=("git" "jq" "curl")
provides=(wofi-emoji-git)
conflicts=(wofi-emoji)
source=("${pkgname}::git+${url}")
sha512sums=("SKIP")

pkgver() {
	cd "${pkgname}"
	echo "0.r$(git rev-list --count HEAD)"
}

build() {
	cd "${pkgname}"
	./build.sh
}

package() {
	cd "${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
