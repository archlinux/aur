# Maintainer: Liao Junxuan <mikeljx at 126 dot com>
pkgname=docx-you-want
pkgver=0.1.1
pkgrel=1
pkgdesc="An unusual PDF-to-DOCX converter"
arch=('x86_64')
url="https://github.com/MikeWalrus/docx-you-want"
license=(GPL3)
depends=(inkscape)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('82ba9ce977f0e1d44b2619c2aac0901d61b3f6ceb217a4dc6f0cc961e3d84ef2')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir"/usr/bin/ "target/release/$pkgname"
}
