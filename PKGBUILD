# Maintainer: Denis Benato <benato.denis96@gmail.org>

pkgname=login-ng
pkgver=0.1.0
pkgrel=1
pkgdesc='A greeter with addition functionalities'
url='https://github.com/neroreflex/login-ng'
license=()
makedepends=('cargo' 'greetd')
depends=()
arch=('i686' 'x86_64' 'armv7h')
source=('login-ng.tar.gz::https://github.com/NeroReflex/login-ng/archive/refs/tags/0.1.0.tar.gz')
b2sums=('d8973f8dcb2f49bb74c65ef8fa18e37bc9a808938a83d821ba5231c4213bf5881686607722e491ce1c4dc4e70332e445df7214345b236c71c7677d9e6a50035f')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
    mkdir -p "$pkgdir/usr/bin/"
    cargo install --root="$pkgdir" --path .
    rm "$pkgdir/.crates2.json"
    rm "$pkgdir/.crates.toml"
}
