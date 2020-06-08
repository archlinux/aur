# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cobang
pkgver=0.4.0
pkgrel=1
pkgdesc="A QR code scanner desktop app for Linux"
arch=('any')
url="https://github.com/hongquan/CoBang"
license=('Apache-2.0')
depends=('gst-python' 'gobject-introspection' 'gtk3' 'gst-plugins-good'
         'python-pillow>=7.1.2' 'python-logbook' 'python-single-version'
         'python-zbar')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c149333054c536fb925db2d6d637555fe44590c4be08b1ad4d9b82a809efaf5c')

build() {
	arch-meson "CoBang-$pkgver" build
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install

	cd "CoBang-$pkgver"
	install -Dm644 LICENSE-2.0.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
