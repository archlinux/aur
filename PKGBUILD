#Maintainer: Rein Fernhout (LevitatingBusinessMan) <me@levitati.ng>

pkgname=batmanager
pkgver=1.0.2
arch=("x86_64")
pkgrel=1
pkgdesc="Tool for configuring Lenovo battery settings"
license=("MIT")
depends=("acpi_call")
makedepends=("cargo")
url="https://github.com/LevitatingBusinessMan/$pkgname"
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('6dd89df69b07ab643d685894ee42181943f1f7cc1b34940ebdc003ffc1b73a5f')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 target/release/$pkgname $pkgdir/usr/bin/$pkgname
}
