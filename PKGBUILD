pkgname=obfuscate-git
pkgver=0.0.2.r7.g8561dae
pkgrel=1
pkgdesc="Censor private information."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://gitlab.gnome.org/World/obfuscate"
license=('GPL3')
depends=('gtk3')
makedepends=('git' 'gobject-introspection' 'meson' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://gitlab.gnome.org/World/obfuscate.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson "${pkgname%-git}" build
	ninja -C build
}

check() {
	ninja -C build test
}

package() {
	DESTDIR="$pkgdir/" ninja -C build install
}
