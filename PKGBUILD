# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gerb-git
_pkgname=${pkgname%-git}
pkgver=1.1.1b2
pkgrel=1
pkgdesc='Graphical font editor (GTK + Rust) '
arch=(x86_64)
url="https://github.com/epilys/$_pkgname"
license=(GPL3)
depends=(gtk3
         librsvg
         python
         python-ufo2ft)
makedepends=(cargo
             git)
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$_pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}


package() {
	cd "$_pkgname"
	install -Dm0755 "target/release/$_pkgname" "$pkgdir/usr/bin/$pkgname"
}
