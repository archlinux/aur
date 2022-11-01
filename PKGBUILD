# Maintainer: Philip Jones <philj56@gmail.com>
pkgname=tofi
pkgver=0.7.0
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
sha512sums=(5e772c63d3e6f6f7ccad6d34ead88dd22dd4e98f4a44b915903730fb76f7cca8e0f9f6f809e7150bf48fbb74d9044f72408ce4f689c492c8b56da47115818908)

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
