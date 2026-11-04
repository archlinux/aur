# Maintainer: Velocifyer <velocifyer at] velocifyer.com> (obfuscated)
pkgname=mosh-rs
pkgver=0.1.3
pkgrel=1
provides=('mosh')
pkgdesc='A rust basde reimplementation of mosh with scrollback support'
url="https://github.com/Arunjay4213/mosh-rs"
source=("mosh-rs-${pkgver}.tar.gz::https://github.com/Arunjay4213/mosh-rs/archive/refs/tags/v${pkgver}.tar.gz")
arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
makedepends=('cargo')
sha256sums=('ad457242a43da2ee00910486049b4e2301fb740844325557f0e391ac1bb12c0e')
conflicts=('mosh')

prepare () {
	cd "$srcdir/mosh-rs-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build () {
	cd "$srcdir/mosh-rs-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features --workspace
}

package() {
	cd "$srcdir/mosh-rs-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/mosh"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/mosh-server"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/mosh-client"
	install -Dm0644 -t "$pkgdir/usr/share/doc/mosh-rs" "README.md"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/mosh-rs" "LICENSE"
}
