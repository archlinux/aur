# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=blanket
pkgver=0.4.1
pkgrel=1
pkgdesc="Improve focus and increase your productivity by listening to different sounds."
arch=('any')
url="https://github.com/rafaelmardojai/blanket"
license=('GPL3')
depends=('gtk3' 'gst-plugins-bad-libs' 'gst-python' 'python-gobject' 'libhandy')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('fbb5f34a704840c50bb5b29f6fae69a2f37677d88db717b79e6bf6fdd625d9eb')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
