# Maintainer: Erik Reider <erik.reider@protonmail.com>

pkgname=scenefx0.5
_pkgname=scenefx
pkgver="0.5"
pkgrel=1
license=("MIT")
pkgdesc="A drop-in replacement for the wlroots scene API that allows wayland compositors to render surfaces with eye-candy effects"
url="https://github.com/wlrfx/scenefx"
arch=("x86_64")
depends=(
	"libdrm"
	"libglvnd"
	"libpixman-1.so"
	"wlroots0.20"
	"wayland"
)
makedepends=(
	"git"
	"glslang"
	"meson"
	"ninja"
	"wayland-protocols"
)
provides=("libscenefx-0.5.so")
conflicts=("scenefx-git" "scenefx")
replaces=("${_pkgname}")
options=("!debug")
source=("${pkgname}.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('055511e88ba4036e6bb4a9f1c5f3a16c4841c518a57b98ad824dd0ecd53c251541a9801be9c760ebf78936400918a51c3b04300f22a47437077d444bc7bc2f08')

build() {
	arch-meson "scenefx-${pkgver}" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}

