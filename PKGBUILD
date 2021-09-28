# Maintainer: Jakob Kruse <contact@jakob-kruse.de>
pkgname=localbang
pkgver=0.4.0
pkgrel=1
license=("MIT")
pkgdesc='Cross-platform, cross-browser, cross-search-engine duckduckgo-like bangs'
url='https://github.com/jakob-kruse/localbang'
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('d6151dc2b2ebf83e0f61db6a9d2462686a336e3b8921cb9abaaf85c27b423ba2')
makedepends=(cargo)
arch=('x86_64')
build() {
    cd "$srcdir/$pkgname-$pkgver"
 
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
 
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 -t "$pkgdir/usr/lib/systemd/user/localbang.service" "example/localbang.service"
}
