# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>


_base_version=0.2

pkgname="scenefx-0.19-mao-git"
pkgver=r274.b92dcb4
pkgrel=1
license=("MIT")
pkgdesc="A drop-in replacement for the wlroots scene API that allows wayland compositors to render surfaces with eye-candy effects"
url="https://github.com/wlrfx/scenefx"
arch=("x86_64")
depends=(
	"libglvnd"
	"wayland"
	"libdrm"
	"libpixman-1.so"
	"wlroots-0.19-mao-git"
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
conflicts=("scenefx" "scenefx-git")
options=("debug")
source=("${pkgname%-*}::git+${url}.git")
sha512sums=("SKIP")

pkgver() {
	cd "scenefx-0.19-mao"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	# export PKG_CONFIG_PATH='/usr/lib/wlroots0.18/pkgconfig'
    cd "$srcdir/scenefx-0.19-mao"
	git checkout wlroots-0.19
    meson setup --buildtype=release --prefix /usr "$srcdir/build"
    ninja -C "$srcdir/build"
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
