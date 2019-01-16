# Maintainer: gilbus <aur(AT)tinkershell.eu>
pkgname=swayidle-git
_pkgname=swayidle
pkgver=r36.1fe7145
pkgrel=1
license=("MIT")
pkgdesc="Sway's idle management daemon"
makedepends=("meson" "git" "scdoc" "wayland-protocols")
depends=(
	"wayland"
)
arch=("i686" "x86_64")
url="https://swaywm.org"
source=("${pkgname%-*}::git+https://github.com/swaywm/swayidle.git")
sha1sums=("SKIP")
provides=("swayidle")
conflicts=("swayidle")
options=(debug !strip)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	meson -Dwerror=false --prefix /usr "$srcdir/build"
}

build() {
	cd "${srcdir}/${_pkgname}"
	ninja -C "$srcdir/build"
}

package() {
	cd "${srcdir}/${_pkgname}"
	DESTDIR="$pkgdir/" ninja -C "$srcdir/build" install
}
