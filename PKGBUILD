# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=darya
pkgver=0.1.5
pkgrel=1
pkgdesc=' Disk usage explorer with a TUI and live treemap'
arch=('x86_64' 'aarch64')
url='https://github.com/mrkatebzadeh/darya'
license=('MIT')
makedepends=('cargo')
provides=('darya')
conflicts=('darya-git' 'darya-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dea36d2b7cc41e7ae7b9c9bff19e34d3043f540832f8b2e61950cb4c6e17f9dc')

prepare() {
    cd "$pkgname-$pkgver"
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
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/darya"
    install -Dm644 LICENSE-3.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
