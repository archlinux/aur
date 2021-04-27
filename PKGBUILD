# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-network-displays
pkgver=0.90.5
pkgrel=1
pkgdesc="Miracast implementation for GNOME"
arch=('any')
url="https://gitlab.gnome.org/GNOME/gnome-network-displays"
license=('GPL3')
depends=('gtk3' 'faac' 'gst-plugins-ugly' 'gst-rtsp-server' 'libpulse' 'libnm'
         'python-gobject' 'x264' 'xdg-desktop-portal')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('1a36cb33735fc8ec50ebdb4b31a507ad870dc2ff4905be5170128f17a9f74172')

build() {
	arch-meson "$pkgname-v$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
