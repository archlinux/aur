# Maintainer: Philip Jones <philj56@gmail.com>
pkgname=gbcc-git
pkgver=r285.e8e4bdc
pkgrel=1
pkgdesc="A Game Boy Color emulator written in C"
arch=("x86_64")
url="https://github.com/philj56/GBCC"
license=("MIT")
groups=()
depends=("sdl2" "gtk3" "libpng" "libepoxy" "openal")
makedepends=("meson" "git" "scdoc")
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
        meson --prefix /usr build
}

build() {
	cd "${pkgname}"
        ninja -C build
}

package() {
	cd "${pkgname}"
        DESTDIR="$pkgdir" ninja -C build install
}
