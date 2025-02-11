# Maintainer: Erik Reider <erik.reider@protonmail.com>

_pkgname=scenefx
_pkgver=0.2
pkgname="$_pkgname"
pkgver="$_pkgver"
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
provides=("libscenefx-$_pkgver.so")
options=("debug")
source=("${_pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/$_pkgver.tar.gz")
sha512sums=("SKIP")

build() {
	arch-meson -Dwerror=false "${_pkgname}-${_pkgver}" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}

