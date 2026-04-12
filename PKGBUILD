# Maintainer: Stephanie M. shteppi@dorcus.digital
# AUR Package for Fluxer TUI (release version)
pkgname=fluxer-tui
pkgver=0.7.0
pkgrel=1
pkgdesc="A terminal-based chat client for the Fluxer messaging platform"
arch=('x86_64')
url="https://github.com/dogbonewish/fluxer-tui"
license=('MIT')
# ring (via rustls) is built with the C toolchain; Arch's default -flto in CFLAGS
# produces native objects the final rustc link step does not merge (undefined ring_core_*).
options=('!lto')
depends=('gcc-libs')
makedepends=('cargo' 'nasm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dogbonewish/fluxer-tui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bcfcadd5f0a64d4dea9e5f3ee09816272b8b3520f30c8cb4a6c1a58dc3412019')

build() {
    cd "$srcdir/fluxer-tui-$pkgver"
    rm -rf target/
    cargo build --release --locked
}

package() {
    cd "$srcdir/fluxer-tui-$pkgver"
    install -Dm755 "target/release/fluxer-tui" "$pkgdir/usr/bin/fluxer-tui"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
