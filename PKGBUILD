# Maintainer: 0drng <0drng@proton.me>

author=0drng
pkgname=nyw
pkgver=0.1.3
pkgrel=4
pkgdesc='Declarative way to manage your packages independent of the system'
url='https://github.com/0drng/nyw'
license=()
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$author/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('2aa3a74d1979456568d75ad425dc917b5ac629d271edf468fb24511d9c90e487')
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

