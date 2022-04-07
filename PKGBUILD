_name="webp-pixbuf-loader"
pkgname="${_name}-git"
pkgdesc="Enable WebP support in GTK apps"
pkgver=2022.03.16
pkgrel=1
url="https://github.com/aruiz/webp-pixbuf-loader"
license=("GPL")
depends=("gdk-pixbuf2" "libwebp")
makedepends=("meson")
arch=("i686" "x86_64")
conflicts=("${_name}")
source=("${_name}::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_name}"
	git log -1 --format="%cd" --date=short | sed 's/-/./g'
}

build() {
	cd "$srcdir/${_name}"
	arch-meson build
	ninja -C build
}

package() {
	cd "$srcdir/${_name}"
	DESTDIR="${pkgdir}" ninja -C build install
}
