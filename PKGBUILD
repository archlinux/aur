# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=gnome-network-displays-git
pkgver=r97.9d3bed6
pkgrel=1
pkgdesc="Miracast implementation for GNOME"
arch=('any')
url="https://github.com/benzea/gnome-network-displays"
license=('GPL3')
depends=('appstream-glib' 'desktop-file-utils' 'faac' 'gst-plugins-ugly' 'gst-rtsp-server' 'libpulse' 'networkmanager' 'python-gobject' 'x264')
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'gnome-screencast')
replaces=('gnome-screencast')
source=('git+https://github.com/benzea/gnome-network-displays')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname%-git}"
	meson . build --prefix /usr
	ninja -C build
}

package() {
 	cd "${pkgname%-git}"
	DESTDIR="$pkgdir" ninja -C build install
}
