# Maintainer: Philip Jones <philj56@gmail.com>
pkgname=greetd-mini-greeter-git
pkgver=r7.02eff1e
pkgrel=1
pkgdesc="Extremely minimal GTK 4 greeter for greetd."
arch=("x86_64")
url="https://github.com/philj56/greetd-mini-greeter"
license=("MIT")
groups=()
depends=("gtk4" "json-c")
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
