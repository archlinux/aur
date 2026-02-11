# Maintainer: walldmtd <walldmtd at proton dot me>

pkgname=cclip
pkgver=3.3.0
pkgrel=1
pkgdesc="Clipboard manager for wayland"
arch=('x86_64')
url="https://github.com/heather7283/cclip"
license=('GPL-3.0-or-later AND MIT') # thirdparty/pollen is under MIT
depends=('glibc' 'libsqlite3.so' 'libwayland-client.so' 'libxxhash.so')
makedepends=('git' 'meson' 'wayland') # 'wayland' is required for `wayland-scanner`
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('47c8c0c9ab1277d26dd58aeaf3e9970117ea62330a807c2047a2b4c91738c0436004f0cdfc91c05c215cdabb1aa444c668c61d1334d4ec6f4ea371038a9af92b')

build() {
	arch-meson --buildtype=release "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"

	cd "$pkgname-$pkgver"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 thirdparty/pollen/LICENSE "$pkgdir/usr/share/licenses/$pkgname/thirdparty/pollen/LICENSE"
}
