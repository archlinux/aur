# Maintainer: Timo Kettenbach
pkgname=taschenrechner
pkgver=2.0.0
pkgrel=1
pkgdesc="a cli-calculator written in rust"
url="https://gitlab.fem-net.de/mabl/taschenrechner"
license=("GPL-3.0")
arch=("any")
depends=()
makedepends=('rust')
provides=("taschenrechner")
conflicts=()
source=("https://gitlab.fem-net.de/mabl/taschenrechner/-/archive/${pkgver}/taschenrechner-${pkgver}.tar.gz")
sha256sums=('415d4f230ea7aa6e4e60f26bcefaf86afc308707d61eb6592d4ae24d36de4944')

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
    install -Dm755 target/release/taschenrechner -t "$pkgdir/usr/bin"
    #install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
