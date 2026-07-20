# Maintainer: Muhammad Nu'man <numany2k2005@gmail.com>
pkgname=cekhalal
pkgver=0.1.2
pkgrel=1
pkgdesc="Terminal UI for searching Malaysia's official JAKIM halal directory (MyeHalal)"
arch=('x86_64' 'aarch64')
url="https://github.com/numan89/cekhalal"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/numan89/cekhalal/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2e2f750689f14cc91d016e799bb4e63de6298f7dfa21a4de30fceb3bbf831656')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
