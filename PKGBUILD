# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>

pkgname=keifu
pkgver=0.4.0
pkgrel=1
pkgdesc="A TUI tool to visualize Git commit graphs with branch genealogy."
url="https://github.com/trasta298/keifu"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/trasta298/keifu/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e306f816bcc3105b8a8b538628d17f04be9b2262fbcdffb84df4f2e87f7392be')
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
