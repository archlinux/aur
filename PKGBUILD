# Maintainer: walldmtd <walldmtd at proton dot me>

pkgname=cclip
pkgver=3.2.1
pkgrel=1
pkgdesc="Clipboard manager for wayland"
arch=('x86_64')
url="https://github.com/heather7283/cclip"
license=('GPL-3.0-or-later AND BSD-2-Clause AND MIT')
depends=('glibc' 'libwayland-client.so' 'libsqlite3.so')
makedepends=('git' 'meson' 'wayland') # 'wayland' is required for `wayland-scanner`
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('46d28b8e26651780fc359082874b758bccb685d443b6fa0d336c69f1e89967e469b0094646d386717350ad3df3f9d299b4b1a07f9124abf552848f56657f5ddd')

build() {
	arch-meson --buildtype=release "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"

	cd "$pkgname-$pkgver"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 thirdparty/getopt/COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/thirdparty/getopt/COPYRIGHT"
	install -Dm644 thirdparty/pollen/LICENSE "$pkgdir/usr/share/licenses/$pkgname/thirdparty/pollen/LICENSE"
	install -Dm644 thirdparty/xxhash/LICENSE "$pkgdir/usr/share/licenses/$pkgname/thirdparty/xxhash/LICENSE"
}
