# Maintainer: Philip Jones <philj56@gmail.com>
pkgname=tofi
pkgver=0.4.0
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
sha512sums=(e03d907ecc1eaa8651a2eea0e05d24e2648fc2610899982b71dc1034cacb63c562c47678c81d9ffc8869b1bd91d3c034b2f5bee4f0c9243c7a750a30c2a47289)

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
