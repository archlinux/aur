# Maintainer: Diogo Alexandre <diogo464 at d464 dot sh>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Luís Ferreira <net dot lsferreira at contact, backwards>

pkgname=railwayapp-cli
pkgver=3.4.0
pkgrel=1
pkgdesc="Command Line Interface for Railway.app"
arch=('x86_64' 'aarch64' 'i686')
url='https://github.com/railwayapp/cli'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7411b02c2353af459d9bbbd809cbdf13df333c84e60d383301e8ff2415bac0b0')

prepare() {
	cd "cli-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "cli-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-features
}

check() {
	cd "cli-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package(){
	cd "cli-$pkgver"
	install -Dv "target/release/railway" -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
