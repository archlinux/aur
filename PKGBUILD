# Maintainer: ldev <ldev dot eu dot org>
pkgver=1.1.0
pkgrel=1

pkgname=git-credential-pass
pkgdesc="A simple git credentials helper for pass"
license=('MIT')
url="https://github.com/Xgames123/$pkgname"
arch=('any')

source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('03d8385a8f0070a774bedb6bd7a43bc59acefc1345fee6da06adf5ef551894a9')
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
