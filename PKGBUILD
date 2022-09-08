# Maintainer: Philip Jones <philj56@gmail.com>
pkgname=tofi
pkgver=0.6.0
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
sha512sums=(dd3514c0012ff6bb77cfae1c248a9fe04bd4104085e7a5bb5cf2d3033e2dcf45b32d1bc3381006ca099cd842db46536f1ae867639477e6594b3d0d387aa95168)

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
