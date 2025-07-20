# Maintainer: Dominik 0drng <dominik.contact@proton.me>

author=0drng
pkgname=nyw
pkgver=0.1.1
pkgrel=2
pkgdesc='Declarative way to manage your packages independent of the system'
url='https://github.com/0drng/nyw'
license=()
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$author/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('803ab2a1e8518a108908ad5f9e1cb16d6ef1ce69e9c6a9c433ec04f0740e4720')
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

