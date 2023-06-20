# Maintainer: Nathan Kolpa <nathan@kolpa.me>
pkgname=pacup
pkgver=1.0.0
pkgrel=1
pkgdesc="Effortlessly manage and replicate your preferred pacman packages on different systems by utilizing a simple plain text file."
arch=('x86_64')
url="https://github.com/NathanKolpa/pacup"
license=('GPL')
depends=()
makedepends=(cargo)
options=()

sha256sums=('2783b01a9e80180dc159154fd50344684f6b265cc33a9affc1fc3607de688b38')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NathanKolpa/pacup/archive/refs/tags/v$pkgver.tar.gz")

prepare() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
