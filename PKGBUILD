# Maintainer: ldev <ldev dot eu dot org> 
pkgver=1.0.0
pkgrel=2

pkgname=gh-login
pkgdesc="A simple git credentials helper for github"
license=('MIT')
url="https://github.com/Xgames123/gh-login"
arch=('any')

binname=git-credential-$pkgname
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xgames123/$pkgname/archive/$pkgver.tar.gz")
b2sums=("SKIP")
makedepends=(
cargo
)
optdepends=(
xdg-utils
wl-clipboard
xclip
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
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$binname"
}
