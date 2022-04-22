# Maintainer: Joaquín Pino <jpinoz at tuta dot io>
_name="webp-pixbuf-loader"
pkgname="${_name}-git"
pkgdesc="WebM GDK Pixbuf Loader library - Git version"
pkgver=0.0.4.r2.g631c1ec
pkgrel=1
url="https://github.com/aruiz/webp-pixbuf-loader"
license=("GPL")
depends=("gdk-pixbuf2" "libwebp")
makedepends=("meson" "git")
arch=("i686" "x86_64" "i486" "pentium4" "aarch64" "armv7h")
conflicts=("${_name}")
source=("${_name}::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
	cd "${_name}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_name}"
	arch-meson build
	ninja -C build
}

package() {
	cd "$srcdir/${_name}"
	DESTDIR="${pkgdir}" ninja -C build install
}
