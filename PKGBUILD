# Maintainer: emersion <contact emersion fr>
pkgname=grim-git
_pkgname=grim
pkgver=r13.9853771
pkgrel=1
license=('MIT')
pkgdesc='Grab images from a Wayland compositor'
makedepends=("meson" "scdoc")
depends=(
	"pango"
	"wayland"
)
arch=("i686" "x86_64")
url='http://github.com/grim'
source=("${pkgname%-*}::git+https://github.com/emersion/grim.git")
sha1sums=('SKIP')
provides=('grim')
conflicts=('grim')

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
