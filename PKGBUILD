# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>

pkgname=keifu
pkgver=0.6.0
pkgrel=1
pkgdesc="A TUI tool to visualize Git commit graphs with branch genealogy."
url="https://github.com/trasta298/keifu"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/trasta298/keifu/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6e8c7b23f29cc99db36bc836cc367fd1f11222b458f24591aa1f7337b8f7d940')
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
