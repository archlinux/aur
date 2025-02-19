# Maintainer: Erik Reider <erik.reider@protonmail.com>

pkgver=0.1
pkgname="scenefx-$pkgver"
pkgrel=2
license=("MIT")
pkgdesc="A drop-in replacement for the wlroots scene API that allows wayland compositors to render surfaces with eye-candy effects"
url="https://github.com/wlrfx/scenefx"
arch=("x86_64")
depends=(
	"libdrm"
	"libglvnd"
	"libpixman-1.so"
	"wayland"
	"wlroots0.17"
)
makedepends=(
	"git"
	"glslang"
	"meson"
	"ninja"
	"wayland-protocols"
)
optdepends=()
provides=("libscenefx-$pkgver.so")
options=("debug")
source=("scenefx-${pkgver}.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
sha512sums=("SKIP")

build() {
	export PKG_CONFIG_PATH='/usr/lib/wlroots0.17/pkgconfig'
	arch-meson -Dwerror=false "scenefx-${pkgver}" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}

