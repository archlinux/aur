# Maintainer: CallMeAlphabet
pkgname=fasthex
pkgver=0.3.0
pkgrel=1
pkgdesc="A very fast hex dumper (x86_64 Linux only) — builds from source"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fasthex"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo')
provides=('fasthex')
conflicts=('fasthex-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CallMeAlphabet/fasthex/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('216977031b5d9b453a5300484b48c507022dc1cebf9608d10c24e8de7a734cf9')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/fasthex" "$pkgdir/usr/bin/fasthex"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
