# Maintainer: Erik Reider <erik.reider@protonmail.com>

pkgname=scenefx0.3
_pkgname=scenefx
pkgver="0.3"
pkgrel=3
license=("MIT")
pkgdesc="A drop-in replacement for the wlroots scene API that allows wayland compositors to render surfaces with eye-candy effects"
url="https://github.com/wlrfx/scenefx"
arch=("x86_64")
depends=(
	"libdrm"
	"libglvnd"
	"libpixman-1.so"
	"wlroots0.18"
	"wayland"
)
makedepends=(
	"git"
	"glslang"
	"meson"
	"ninja"
	"wayland-protocols"
)
provides=("libscenefx-${pkgver}.so")
conflicts=("scenefx-git" "scenefx")
replaces=("${_pkgname}")
options=("!debug")
source=("${pkgname}.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
sha512sums=("SKIP")

build() {
	arch-meson "scenefx-${pkgver}" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}

