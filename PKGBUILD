# Maintainer: Dominik 0drng <dominik.contact@proton.me>

author=0drng
pkgname=nyw
pkgver=0.1.0
pkgrel=1
pkgdesc='Declarative way to manage your packages independent of the system'
url='https://github.com/0drng/nyw'
license=()
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$author/$pgkname/archive/$pkgver.tar.gz")
sha256sums=('9b81f0affb04528fbfa590253b662a0665afb0c43e4398a6c1cca4b7e2ea8e6f')
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

