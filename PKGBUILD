# Maintainer: Timo Kettenbach
pkgname=taschenrechner
pkgver=1.4.0
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
sha256sums=('669556764d427c9e78443c19d427185579dc2006cd7feeb5a9f9f19d98b61945')

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
