pkgname=ovpn-status
pkgver=0.7.2
pkgrel=1
pkgdesc="OVPN's status page in the terminal."
url='https://github.com/APT37/ovpn-status'
arch=('x86_64')
makedepends=('git' 'cargo')
license=('MIT-0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0388c187681f13dd6c704c2a1319cce15b416c66041ddf0aaa5f9e3f73f1d458')
options=('!lto')
provides=('ovpn-status')
conflicts=('ovpn-status-bin' 'ovpn-status-git')

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 'target/release/ovpn-status' -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$pkgname"
}

