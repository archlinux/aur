# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=wike
pkgver=1.5.3
pkgrel=1
pkgdesc="Wikipedia Reader for the GNOME Desktop"
arch=('x86_64')
url="https://github.com/hugolabe/Wike"
license=('GPL3')
depends=('gtk3' 'libhandy' 'python-gobject' 'python-requests' 'webkit2gtk')
makedepends=('meson')
#checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('882f27a96828f408d56736c47f90ff16dd975cf9ccf12105cddc00cba184ab7f')

build() {
	arch-meson Wike-$pkgver build
	meson compile -C build
}

check() {

	# Validate appstream file fails, only validate desktop & schema files
	meson test 'Validate desktop file' 'Validate schema file' -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
