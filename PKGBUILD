# Maintainer: Nabiko02 <Lusty3418Charger1631Retold5412@proton.me>
pkgname=recway
pkgver=1.0.0
pkgrel=1
pkgdesc="Frontend for wf-recorder screen recorder"
arch=('x86_64' 'aarch64')
url="https://github.com/nabiko02/recway"
license=('MIT')
depends=('wf-recorder' 'wlr-randr')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b1e984155773f7c6ae24ee5bbc8fe92bf889fdc25d980ed5859bf8fe0d9d636e')

prepare() {
    cd "$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
