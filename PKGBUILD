# Maintainer: Zachary Smith <zachir at pm dot me>
# Thanks to the upstream tofi maintainer:
# Contributor: Philip Jones <philj56 at gmail dot com>
pkgname=tofi-dmenu
pkgver=0.9.1
pkgrel=1
pkgdesc="Tiny rofi / dmenu replacement for wlroots-based Wayland compositors, with dmenu flags."
arch=("x86_64")
url="https://github.com/ZachIndigo/tofi-dmenu.git"
license=("MIT")
depends=("freetype2" "harfbuzz" "cairo" "pango" "wayland" "libxkbcommon" "glib2")
makedepends=("meson" "git" "scdoc" "wayland-protocols")
provides=("${pkgname%-dmenu}")
conflicts=("${pkgname%-dmenu}" "${pkgname%-dmenu}-git")
_tag=5930c08bcad57850679ae09c59700851e5ab9ec6 # git rev-parse "v${pkgver}-zir"
source=("${pkgname}::git+${url}#tag=${_tag}")
sha512sums=("SKIP")

prepare() {
	cd "${pkgname}"
        meson setup build --prefix /usr -Dbuildtype=release
}

build() {
	cd "${pkgname}"
        ninja -C build
}

package() {
	cd "${pkgname}"
        DESTDIR="$pkgdir" ninja -C build install
}
