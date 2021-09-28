# Maintainer: Jakob Kruse <contact@jakob-kruse.de>
pkgname=localbang
pkgver=0.3.2
pkgrel=1
license=("MIT")
pkgdesc='Cross-platform, cross-browser, cross-search-engine duckduckgo-like bangs'
url='https://github.com/jakob-kruse/localbang'
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('062ead8a2413571adb3658116b8b97425ad20c8d74ecfa2de108e768e94a1761')
makedepends=(cargo)
arch=('x86_64')
build() {
    cd "$srcdir/$pkgname-$pkgver"
 
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
 
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 -t "$pkgdir/usr/lib/systemd/user/localbang.service" "example/localbang.service"
}
