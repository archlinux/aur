# Maintainer: ldev <ldev dot eu dot org>
pkgver=1.0.1
pkgrel=1

pkgname=git-credential-pass
pkgdesc="A simple git credentials helper for pass"
license=('MIT')
url="https://github.com/Xgames123/$pkgname"
arch=('any')

source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e18a238ccc7b1718be383d6a5acffaef259085fb6fbfab2ec96516b500243840')
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
