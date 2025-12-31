# Maintainer: Max Tottenham <mtottenh@gmail.com>
pkgname=pcapsql
pkgver=0.2.0
pkgrel=1
pkgdesc="SQL query engine for PCAP network traffic analysis"
arch=('x86_64')
url="https://github.com/mtottenh/pcapsql"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mtottenh/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0e58eecc4bf7b6ce8e378ad5204e43cfa55c69e7e6271aac37547dbc55f2a1c6')

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
