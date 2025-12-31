pkgname=ovpn-status
pkgver=0.7.3
pkgrel=1
pkgdesc="OVPN's status page in the terminal."
url='https://github.com/APT37/ovpn-status'
arch=('any')
makedepends=('git' 'cargo')
license=('MIT-0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f28b37a31a68c1fc7554b2b766e0f12653ff6c37093addee5570fe825fea3473')
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

