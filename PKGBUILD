# Maintainer: Philip Jones <philj56@gmail.com>
pkgname=tofi
pkgver=0.5.0
pkgrel=1
pkgdesc="Tiny rofi / dmenu replacement for wlroots-based Wayland compositors."
arch=("x86_64")
url="https://github.com/philj56/tofi"
license=("MIT")
groups=()
depends=("freetype2" "harfbuzz" "cairo" "pango" "wayland" "libxkbcommon")
makedepends=("meson" "scdoc" "wayland-protocols")
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("https://github.com/philj56/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
noextract=()
sha512sums=(40b0c14f6b1ecc82cb2d27c957578dbc7570e9beff65c83cbcbf33a87e77881482225dc4e30fd19bd5b501a3ca119dfaec944182b4e903e3ba1eabe9a90d3488)

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
