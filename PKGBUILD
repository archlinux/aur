# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=hotwire-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="A GTK application that leverages Wireshark and tshark to capture traffic for analysis"
arch=('x86_64')
url="https://github.com/emmanueltouzery/hotwire"
license=('MIT')
depends=('gtk3' 'tcpdump' 'wireguard-tools')
makedepends=('cargo')
install=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('0604ee2dcbe46764bfee24ba81995cb84f33db2980f27d1979d583f5b2a1c31d')

build() {
	cd "hotwire-$pkgver"
	cargo build --release --locked --all-features --target-dir=target
}

check() {
	cd "hotwire-$pkgver"
	cargo test --release --locked --target-dir=target
}

package() {
	cd "hotwire-$pkgver"
	install -Dm 755 target/release/hotwire -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
