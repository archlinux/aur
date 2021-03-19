# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Philip Goto <philip.goto@gmail.com>
pkgname=shortwave-git
pkgver=1.1.1.r282.g7ec5b7d
pkgrel=2
pkgdesc="Find and listen to internet radio stations"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/Shortwave"
license=('GPL3')
depends=('gst-plugins-bad' 'gtk4' 'libadwaita')
makedepends=('git' 'meson' 'rust' 'wayland-protocols')
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
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
