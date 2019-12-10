# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=gnome-network-displays-git
pkgver=0.90.1.13.g47de30a
pkgrel=2
pkgdesc="Miracast implementation for GNOME"
arch=('any')
url="https://github.com/benzea/gnome-network-displays"
license=('GPL3')
depends=('gtk3' 'faac' 'gst-plugins-ugly' 'gst-rtsp-server' 'libpulse' 'libnm' 'python-gobject'
         'x264' 'xdg-desktop-portal')
makedepends=('git' 'meson' 'appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=('gnome-screencast')
source=('git+https://github.com/benzea/gnome-network-displays')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/([^-]*-g)/r/;s/-/./g')"
}

build() {
	cd "${pkgname%-git}"
	arch-meson . build
	ninja -C build
}

package() {
 	cd "${pkgname%-git}"
	DESTDIR="$pkgdir" ninja -C build install
}
