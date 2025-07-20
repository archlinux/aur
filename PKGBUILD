# Maintainer: Dominik 0drng <dominik.contact@proton.me>

author=0drng
pkgname=nyw
pkgver=0.1.2
pkgrel=3
pkgdesc='Declarative way to manage your packages independent of the system'
url='https://github.com/0drng/nyw'
license=()
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$author/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('7651182d06f7870bd001f3fc0aa4952d8a1eb3ebf8a4f4426006c366fdca7cc2')
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

