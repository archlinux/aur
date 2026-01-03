# Maintainer: konkitoman <open.issue.on@github.com>
# Contributor: Leah Anderson <leah.anderson4435@proton.me>
pkgname=theclicker
pkgver=0.3.1
pkgrel=1
pkgdesc="Autoclicker coded in Rust for Wayland and X11"
arch=('x86_64')
url="https://github.com/konkitoman/autoclicker"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('2da1942a50d81baaa765a783879560ca87c986b4a244c9168e894249e0f3482c9f6ebbbe6a86d649f66ab659ce923765d88d88abedb153ace3d7728ec65452b9')
options=(!debug)
install="$pkgname.install"

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target $(rustc --print host-tuple)
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
	cargo test --frozen
}

package() {
	cd "$pkgname-$pkgver"
	install -vDm 755 -t "$pkgdir/usr/bin/" target/release/theclicker
	install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -vDm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
