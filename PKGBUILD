# Maintainer: Takahiro Sato <harehare1110@gmail.com>
pkgname=markdown-query
_pkgname=mq
pkgver=0.5.31
pkgrel=1
pkgdesc="A jq-like command-line tool for Markdown processing"
arch=('x86_64' 'aarch64')
url="https://mqlang.org/"
license=('MIT')
depends=()
makedepends=('cargo' 'rust')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/harehare/mq/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9be94d114a4cec216733c357b642aaf5be40dc352f43c300ff8b1460135f0b82')

prepare() {
    cd "$_pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p mq-run
}

check() {
    cd "$_pkgname-$pkgver"
    cargo test --frozen -p mq-run
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm755 "target/release/mq" "$pkgdir/usr/bin/mq"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

