# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tássio Virgínio <tassiovirginio@gmail.com>

pkgname=try-rs
pkgver=0.1.35
pkgrel=1
pkgdesc="A blazing fast, Rust-based workspace manager for your temporary experiments"
arch=('x86_64')
url="https://github.com/tassiovirginio/try-rs"
license=('MIT') 
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5f0c3651239d1064cc79456a33d7d44ee23c40c89791bbcd8b26ce7ef4bfa273')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

# TODO - uncomment once upstream implements tests
# check() {
#     export RUSTUP_TOOLCHAIN=stable
#     cd "$pkgname-$pkgver"
#     cargo test --frozen --all-features
# }

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/docs/$pkgname/" README.md
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

