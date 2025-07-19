pkgname=mullvad-socks
pkgver=1.3.0
pkgrel=1
pkgdesc="Filter Mullvad's SOCKS5 proxies by country, city, weight and online status."
url='https://github.com/APT37/mullvad-socks'
arch=('x86_64')
makedepends=('git' 'cargo')
license=('MIT-0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e009c3a09346a582c3ed0f38e0ada50f0e63384801ccbb9f13a373de5f053b1c')
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

