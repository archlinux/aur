# Maintainer: Philip Jones <philj56@gmail.com>
pkgname=tofi
pkgver=0.9.0
pkgrel=1
pkgdesc="Tiny rofi / dmenu replacement for wlroots-based Wayland compositors."
arch=("x86_64")
url="https://github.com/philj56/tofi"
license=("MIT")
groups=()
depends=("freetype2" "harfbuzz" "cairo" "pango" "wayland" "libxkbcommon" "glib2")
makedepends=("meson" "scdoc" "wayland-protocols")
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("https://github.com/philj56/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
noextract=()
sha512sums=(3da10cd4ae59b6d79c370866d112522c4ad6c301b8e4eff25a036894ee51bf77fca4d8248554fed517e789a18f8ffbca13837055359cb2720cf414c9dd77a988)

prepare() {
	rm -rf build
        meson setup "${pkgname}-${pkgver}" build --prefix /usr -Dbuildtype=release
}

build() {
        ninja -C build
}

package() {
        DESTDIR="$pkgdir" ninja -C build install
}
