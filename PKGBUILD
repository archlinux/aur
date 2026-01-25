# Maintainer: ldev <ldev dot eu dot org>
pkgver=1.3.0
pkgrel=2

pkgname=git-credential-pass
pkgdesc="A simple git credentials helper for pass"
license=('MIT')
url="https://github.com/Xgames123/$pkgname"
arch=('any')

source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d10bfdf8794baaa81418ad46ebcebbe2bd19336f61aa6b8a47468cc6379530ca')
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


package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
