pkgname=mullvad-socks
pkgver=1.4.1
pkgrel=1
pkgdesc="Filter Mullvad's SOCKS5 proxies by country, city, weight and online status."
url='https://github.com/APT37/mullvad-socks'
arch=('x86_64')
makedepends=('git' 'cargo')
license=('MIT-0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5d96a82688d0781dff24495699325e6232371acdf678c95b5eace001bee03e1d')
options=('!lto')
provides=('mullvad-socks')
conflicts=('mullvad-socks-bin' 'mullvad-socks-git')

build() {
	cd $pkgname-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 'target/release/mvs-cli' -t "$pkgdir/usr/bin"
	install -Dm755 'target/release/mvs-web' -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
}

