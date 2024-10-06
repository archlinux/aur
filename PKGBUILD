# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>
pkgname=sgf-render
pkgver=3.2.2
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
sha256sums=('b060dadd52bf4abec802b12df22e237a58c76d1adc5a958dcb8897b058eb4b8a')
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

