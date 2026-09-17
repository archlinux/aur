# SPDX-License-Identifier: 0BSD
# Maintainer: M Stoeckl <com dоt mstoeckl аt code>
pkgname=windowtolayer
pkgver=0.4.0
pkgrel=1
pkgdesc='Modify existing Wayland clients using xdg-shell to draw as a wallpaper instead'
license=('GPL-3.0-or-later')
makedepends=('rust' 'cargo' 'python')
url='https://gitlab.freedesktop.org/mstoeckl/windowtolayer'
source=("https://gitlab.freedesktop.org/mstoeckl/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('cf96f432d746f7660d2bd819d93448a39361468f8abc686ffcda2e5b493a02a5')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')

prepare() {
	cd "$pkgname-v$pkgver"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-v$pkgver"
	CARGO_INCREMENTAL=0 cargo build --release --locked --offline
}

package() {
	cd "$pkgname-v$pkgver"
	install -D -m755 "target/release/windowtolayer" "$pkgdir/usr/bin/windowtolayer"
	install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
