# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=mako-git
_pkgname=mako
pkgver=r268.23d9e4a
pkgrel=1
license=('MIT')
pkgdesc='Lightweight notification daemon for Wayland'
makedepends=("meson" "scdoc" "wayland-protocols")
depends=(
	"pango"
	"cairo"
	"wayland"
)
arch=("i686" "x86_64")
url='http://mako-project.org'
source=("${pkgname%-*}::git+https://github.com/emersion/mako.git")
sha1sums=('SKIP')
provides=('mako')
conflicts=('mako')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"

	meson --prefix=/usr . build
	ninja -C build
}

package() {
	cd "${srcdir}/${_pkgname}"

	DESTDIR="$pkgdir/" ninja -C build install
}
