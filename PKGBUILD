pkgname=nyaa
pkgver=0.4.1
pkgrel=1
pkgdesc="A tui tool for browsing and downloading torrents from nyaa.si"
url='https://github.com/Beastwick18/nyaa/'
arch=(x86_64)
license=('GPL-3.0-or-later')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('SKIP')

prepare() {
	cd $pkgname-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd $pkgname-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd $pkgname-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd $pkgname-$pkgver
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
