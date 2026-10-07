# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=quvyta-focus
pkgver=0.1.16
pkgrel=1
pkgdesc="Productivity counter"
arch=(x86_64)
url="https://github.com/quvyta/focus"
license=(MIT)
depends=(glibc libgcc libgcc_s.so)
makedepends=(cargo)
provides=(qfocus)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('4d554b288288430135a865580e402f0fa37926a9a42fd9ca8535015aff8dd8be')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$pkgname-$pkgver"
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

# check() {
#     export RUSTUP_TOOLCHAIN=stable
# 
#     cd "$_pkgname"
#     cargo test --frozen --all-features
# }

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/"{"$pkgname",qfocus} -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

