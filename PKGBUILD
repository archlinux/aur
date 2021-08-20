# Maintainer: Jeff Wright <jeff@teamjk.page>
pkgname=diskonaut
pkgver=0.11.0
pkgrel=1
pkgdesc="TUI disk space navigator written in rust"
arch=('x86_64')
url="https://github.com/imsnif/diskonaut"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
checkdepends=('cargo')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)

prepare() {
	cd $pkgname-$pkgver
    	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd $pkgname-$pkgver
	export RUSTUP_TOOLCHAIN=stable
    	export CARGO_TARGET_DIR=target
	cargo build --release --locked --all-features --frozen
}

check() {
	cd $pkgname-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --locked
}

package() {
	cd $pkgname-$pkgver
	install -Dm 755 target/release/${pkgname} -t ${pkgdir}/usr/bin
	install -Dm 644 README.md -t $pkgdir/usr/share/doc/${pkgname}
	install -Dm 644 LICENSE -t $pkgdir/usr/share/licenses/${pkgname}
}
sha256sums=('355367dbc6119743d88bfffaa57ad4f308596165a57acc2694da1277c3025928')
