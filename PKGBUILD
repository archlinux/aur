# Maintainer: Timo Kettenbach
pkgname=iperf3d
pkgver=1.0.0
pkgrel=1
pkgdesc="iperf3d is a iperf3 client and server wrapper for dynamic server ports"
url="https://github.com/wobcom/iperf3d"
license=("MIT")
arch=("any")
depends=("iperf3")
makedepends=('rust')
provides=("iperf3d")
conflicts=()
source=("https://github.com/wobcom/iperf3d/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9d3eb0ebd0f82544834c9da26221df1cd06d7f1f03788292624d505e42964dd0')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"	
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-targets	
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm755 target/release/iperf3d -t "$pkgdir/usr/bin"
    #install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
