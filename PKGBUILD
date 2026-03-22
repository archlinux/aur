# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>

pkgname=keifu
pkgver=0.2.4
pkgrel=1
pkgdesc="A TUI tool to visualize Git commit graphs with branch genealogy."
url="https://github.com/trasta298/keifu"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/trasta298/keifu/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5edfa92d9614da905a1a3311ecd0cffa3ff3add52f682b146bc8c87220a10dc8')
arch=('x86_64')
depends=('git' 'gcc-libs')
makedepends=('cargo')

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
