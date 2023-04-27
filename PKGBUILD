# Maintainer: acuteenvy
pkgname=tlrc
pkgver=1.1.0
pkgrel=1
pkgdesc="A tldr client written in Rust"
arch=('x86_64')
url="https://github.com/acuteenvy/$pkgname"
license=('MIT')
makedepends=('cargo')
provides=('tldr')
conflicts=('tldr')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('09896b47c76a9515872b4d22d32eed2bbe65f026359d68df62db4537b3d383d5fa67cf46958562c7b9f3a171063bc3a6d81ee1210fad55cafae9eb2c8934f2f8')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/tldr" -t "$pkgdir/usr/bin"
    install -Dm644 tldr.1 -t "$pkgdir/usr/share/man/man1"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
