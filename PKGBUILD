# Maintainer: Dominik 0drng <dominik.contact@proton.me>

pkgname=nywida
pkgver=0.1.0alpha
pkgrel=1
pkgdesc='Declarative package helper for pacman and existing aur helper'
url='https://github.com/0drng/nywida'
license=()
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/0drng/nywida/archive/$pkgver.tar.gz")
sha256sums=('d792dae13dd9e11dfb43aed7cc8239efb603db982408f90b824f2c49cb57d13e')
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

