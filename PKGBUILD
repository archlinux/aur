# Maintainer: Dominik 0drng <dominik.contact@proton.me>

pkgname=nywida
pkgver=0.1.3beta
pkgrel=1
pkgdesc='Declarative package helper for pacman and existing aur helper'
url='https://github.com/0drng/nywida'
license=()
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/0drng/nywida/archive/$pkgver.tar.gz")
sha256sums=('4d3a0da806fcb52d09aefdb31b5f2ea3ce9e8915e1bb48ba38061623df611a97')
OPTIONS=(!debug)

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

