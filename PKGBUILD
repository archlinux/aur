# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>
pkgname=dumbpipe
pkgver=0.4.0
pkgrel=1
pkgdesc="Connect A to B. Send Data."
arch=('any')
url="https://github.com/n0-computer/dumbpipe"
license=('MIT' 'Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('5509bfbd1ed08719afbf2aaf29a4a616939dffbc7974579079435ed4fb2833b60eb60085df2528ac566dc61aeb25e02a9b5bdb0129a07206cad280788854989f')

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
