# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-network-displays-git
pkgver=0.90.3.4.gb59cd2f
pkgrel=1
pkgdesc="Miracast implementation for GNOME"
arch=('any')
url="https://gitlab.gnome.org/GNOME/gnome-network-displays"
license=('GPL3')
depends=('gtk3' 'faac' 'gst-plugins-ugly' 'gst-rtsp-server' 'libpulse' 'libnm'
         'python-gobject' 'x264' 'xdg-desktop-portal')
makedepends=('git' 'meson' 'appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/GNOME/gnome-network-displays.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/([^-]*-g)/r/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	arch-meson . build
	ninja -C build
}

package() {
 	cd "$srcdir/${pkgname%-git}"
	DESTDIR="$pkgdir" ninja -C build install
}
