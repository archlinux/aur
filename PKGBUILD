pkgname=tootle-git-vpzomtrrfrt
pkgver=r435.85a8c6b
pkgrel=1
pkgdesc='GTK4 client for Mastodon (git, vpzomtrrfrt fork)'
url='https://github.com/vpzomtrrfrt/tootle'
license=("GPL3")
depends=("gtk4" "libadwaita" "glib2" "libgee" "libsoup" "json-glib" "libxml2" "libsecret")
makedepends=("meson" "ninja" "vala" "gobject-introspection")
provides=("tootle")
conflicts=("tootle")
source=("git+$url")
sha512sums=("SKIP")
arch=("x86_64")

pkgver() {
	cd tootle
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd tootle
	arch-meson build
	ninja -C build
}

package() {
	cd tootle
	DESTDIR="$pkgdir" ninja -C build install
}
