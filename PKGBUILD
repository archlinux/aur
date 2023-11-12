# Maintainer: ldev <ldev dot eu dot org>
pkgver=1.0.0
pkgrel=1

pkgname=git-credential-pass
pkgdesc="A simple git credentials helper for gnu pass"
license=('MIT')
url="https://github.com/Xgames123/$pkgname"
arch=('any')

source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('168dac3e27c068e4747415dbbb56a53df8a699c649a7fca860bcdabf32710289')
conflicts=("git-credential-pass-git")
makedepends=(
cargo
)
depends=(
  pass
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    
    rm -f Cargo.lock
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch
}


build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
