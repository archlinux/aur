# Maintainer: Simon Blum <simon21.blum@gmail.com>

pkgname=tokenize
pkgver=0.1.1
pkgrel=1
pkgdesc='Tokenize your codebase blazingly fast into a single file for LLM Context 🚀🤖 (doesnt actually tokenize lol)'
url='https://github.com/DefinitelyNotSimon13/tokenize'
license=('MIT')
arch=('x86_64')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar-gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$srcdir/$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    
    cd "$srcdir/$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
