# Maintainer: Stephanie M. shteppi@dorcus.digital
# AUR Package for Fluxer TUI (release version)
pkgname=fluxer-tui
pkgver=0.7.5
pkgrel=1
pkgdesc="A terminal-based chat client for the Fluxer messaging platform"
arch=('x86_64')
url="https://github.com/dogbonewish/fluxer-tui"
license=('MIT')
options=('!lto')
depends=('gcc-libs')
makedepends=('cargo' 'nasm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dogbonewish/fluxer-tui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5c032192c93a6b7ccf5d1fad360ddcc89e3a4fa44f331c0e312b55386624632e')

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
