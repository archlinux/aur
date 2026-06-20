# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>

pkgname=keifu
pkgver=0.5.0
pkgrel=1
pkgdesc="A TUI tool to visualize Git commit graphs with branch genealogy."
url="https://github.com/trasta298/keifu"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/trasta298/keifu/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0311321f62218fdd14d594a8ae659afd7cd5bed4157b14bdb62bf524ea7d0c1b')
arch=('x86_64')
depends=('git' 'gcc-libs')
makedepends=('cargo')
options=(!lto)

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
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
