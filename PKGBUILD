# Maintainer: Erik Reider <erik.reider@protonmail.com>

_base_version="0.2"

pkgname=scenefx
pkgver="${_base_version}.1"
pkgrel=1
license=("MIT")
pkgdesc="A drop-in replacement for the wlroots scene API that allows wayland compositors to render surfaces with eye-candy effects"
url="https://github.com/wlrfx/scenefx"
arch=("x86_64")
depends=(
	"libdrm"
	"libglvnd"
	"libpixman-1.so"
	"wayland"
	"wlroots"
)
makedepends=(
	"git"
	"glslang"
	"meson"
	"ninja"
	"wayland-protocols"
)
optdepends=()
provides=("libscenefx-$_base_version.so")
options=("debug")
source=("scenefx-${pkgver}.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
sha512sums=("SKIP")

build() {
	arch-meson -Dwerror=false "scenefx-${pkgver}" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}

