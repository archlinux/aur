# Maintainer: Erik Reider <erik.reider@protonmail.com>

_pkgname=scenefx
pkgname="$_pkgname-git"
pkgver=r213.e1f4bc5
pkgrel=1
license=("MIT")
pkgdesc="A drop-in replacement for the wlroots scene API that allows wayland compositors to render surfaces with eye-candy effects"
url="https://github.com/wlrfx/scenefx"
arch=("x86_64")
depends=(
	"libwlroots.so"
	"libglvnd"
	"wayland"
	"libdrm"
	"libpixman-1.so"
)
makedepends=(
	"git"
	"glslang"
	"meson"
	"ninja"
	"wayland-protocols"
)
optdepends=()
conflicts=("scenefx" "scenefx-git")
provides=("libscenefx.so")
options=("debug")
source=("${pkgname%-*}::git+${url}.git")
sha512sums=("SKIP")

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson -Dwerror=false "$_pkgname" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
