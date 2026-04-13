# Maintainer: Stephanie M. shteppi@dorcus.digital
# AUR Package for Fluxer TUI (release version)
pkgname=fluxer-tui
pkgver=0.7.1
pkgrel=1
pkgdesc="A terminal-based chat client for the Fluxer messaging platform"
arch=('x86_64')
url="https://github.com/dogbonewish/fluxer-tui"
license=('MIT')
options=('!lto')
depends=('gcc-libs')
makedepends=('cargo' 'nasm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dogbonewish/fluxer-tui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f63547efac920d09b2cb0ccce93f075fcbe6a5d1a64ddbbb99d0c2f1c9ded2a1')

build() {
    cd "$srcdir/fluxer-tui-$pkgver"
    rm -rf target/
    export RUSTFLAGS="${RUSTFLAGS} -C link-arg=-fuse-ld=bfd"
    cargo build --release --locked
}

package() {
    cd "$srcdir/fluxer-tui-$pkgver"
    install -Dm755 "target/release/fluxer-tui" "$pkgdir/usr/bin/fluxer-tui"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
