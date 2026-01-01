# Maintainer: Max Tottenham <mtottenh@gmail.com>
pkgname=pcapsql
pkgver=0.3.0
pkgrel=1
pkgdesc="SQL query engine for PCAP network traffic analysis"
arch=('x86_64')
url="https://github.com/mtottenh/pcapsql"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mtottenh/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0034179909d55402b2e77e84cb2546ad018234242a6981bb6c4fb07e4eb54ec1')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release -p pcapsql-datafusion
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/pcapsql "$pkgdir/usr/bin/pcapsql"
    install -Dm644 target/assets/pcapsql.1 "$pkgdir/usr/share/man/man1/pcapsql.1"
    install -Dm644 target/assets/pcapsql.bash "$pkgdir/usr/share/bash-completion/completions/pcapsql"
    install -Dm644 target/assets/pcapsql.zsh "$pkgdir/usr/share/zsh/site-functions/_pcapsql"
    install -Dm644 target/assets/pcapsql.fish "$pkgdir/usr/share/fish/vendor_completions.d/pcapsql.fish"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
