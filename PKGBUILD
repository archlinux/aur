# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Philip Goto <philip.goto@gmail.com>
pkgname=shortwave-git
pkgver=1.0.1.r34.g5454d6e
pkgrel=1
pkgdesc="Find and listen to internet radio stations"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://gitlab.gnome.org/World/Shortwave"
license=('GPL3')
depends=('gst-plugins-bad' 'libhandy')
makedepends=('git' 'gobject-introspection' 'libdazzle' 'meson' 'rust' 'xorgproto')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://gitlab.gnome.org/World/Shortwave.git")
sha256sums=('SKIP')

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
