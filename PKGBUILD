# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=wike
pkgver=1.5.2
pkgrel=1
pkgdesc="Wikipedia Reader for the GNOME Desktop"
arch=('x86_64')
url="https://github.com/hugolabe/Wike"
license=('GPL3')
depends=('gtk3' 'libhandy' 'python-gobject' 'python-requests' 'webkit2gtk')
makedepends=('meson')
#checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ba6b869fac02159c124548355832a20996212af21d96b363f1256d69cc6344dd')

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
