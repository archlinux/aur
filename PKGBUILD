# Maintainer: ldev <ldev dot eu dot org>
pkgver=1.2.0
pkgrel=2

pkgname=git-credential-pass
pkgdesc="A simple git credentials helper for pass"
license=('MIT')
url="https://github.com/Xgames123/$pkgname"
arch=('any')

source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b324dc377a463ba59082dbc71aabcbd99060aca54d8dde9582aa48b56bf70f07')
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
