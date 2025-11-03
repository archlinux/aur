# Maintainer: r3dg0d <r3dg0d@users.noreply.github.com>
pkgname=geolocate-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple, fast command-line tool for geolocating IP addresses and domain names"
arch=('x86_64')
url="https://github.com/r3dg0d/geolocate"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm 755 "target/release/geolocate" "$pkgdir/usr/bin/geolocate-rs"
    install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

