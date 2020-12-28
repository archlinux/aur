# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Philip Goto <philip.goto@gmail.com>
pkgname=shortwave-git
pkgver=1.1.1.r70.g2b35803
pkgrel=1
pkgdesc="Find and listen to internet radio stations"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/Shortwave"
license=('GPL3')
depends=('gst-plugins-bad' 'gtk3' 'libhandy')
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
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
