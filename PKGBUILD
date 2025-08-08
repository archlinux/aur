pkgname=ovpn-status-git
pkgver=vcs
pkgrel=1
pkgdesc="OVPN's status page in the terminal."
url='https://github.com/APT37/ovpn-status'
arch=('x86_64')
makedepends=('git' 'cargo')
license=('MIT-0')
source=("ovpn-status-$pkgver::git+$url")
sha256sums=('SKIP')
options=('!lto')
provides=('ovpn-status')
conflicts=('ovpn-status' 'ovpn-status-bin')

build() {
	cd "ovpn-status-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release
}

package() {
	cd "ovpn-status-$pkgver"
	install -Dm755 'target/release/ovpn-status' -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$pkgname"
}
