# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>
pkgname=sgf-render
pkgver=3.0.2
pkgrel=1
pkgdesc="Sgf Rendering CLI written in Rust"
arch=('x86_64')
url="https://github.com/julianandrews/sgf-render/"
license=('MIT')
depends=(
    'gcc-libs'
    'glibc'
)
makedepends=(
    'cargo'
    )
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('309325dd8f9e017f829346ca8a5f278cd600630a26519645091586e2b4ccb801')
options=("debug" "!strip")

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

