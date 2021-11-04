# Maintainer: Philip Jones <philj56@gmail.com>
pkgname=greetd-mini-wl-greeter-git
pkgver=r30.c28c524
pkgrel=1
pkgdesc="Extremely minimal Wayland greeter for greetd."
arch=("x86_64")
url="https://github.com/philj56/greetd-mini-wl-greeter"
license=("MIT")
groups=()
depends=("cairo" "glib2" "json-c" "libepoxy" "libpng" "libxkbcommon" "pango" "wayland")
makedepends=("meson" "git" "scdoc" "wayland-protocols")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname}::git+${url}")
noextract=()
sha512sums=("SKIP")

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${pkgname}"
        meson --prefix /usr -Dbuildtype=release build
}

build() {
	cd "${pkgname}"
        ninja -C build
}

package() {
	cd "${pkgname}"
        DESTDIR="$pkgdir" ninja -C build install
}
