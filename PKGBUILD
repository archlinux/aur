# Maintainer: Timo Kettenbach
pkgname=taschenrechner
pkgver=1.0.0
pkgrel=1
pkgdesc="a cli-calculator written in rust"
url="https://gitlab.fem-net.de/mabl/taschenrechner"
license=("GPL-3.0")
arch=("x86_64")
depends=()
makedepends=('rust')
provides=("taschenrechner")
conflicts=()
source=("https://gitlab.fem-net.de/mabl/taschenrechner/-/archive/${pkgver}/taschenrechner-${pkgver}.tar.gz")
sha256sums=('e1cec59388f2ed4eba3119db0d832b5dcb278ae13bec13512887d10720b27ce4')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --offline --target "$CARCH-unknown-linux-gnu"	
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-targets	
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm755 target/release/taschenrechner -t "$pkgdir/usr/bin"
    #install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
