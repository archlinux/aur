# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=whyq
pkgver=0.11.1
pkgrel=2
pkgdesc="jq compatible yq implementation in rust"
url="https://github.com/clux/lq"
arch=("x86_64")
license=("Apache")
depends=("cargo")
source=("https://github.com/clux/lq/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('698ab52a8aa74e59cb05f1e835d3be1ec7e762e09843bbe2a6fbe29143f41e31')

prepare()
{
    cd "$srcdir/lq-$pkgver"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build()
{
    cd "$srcdir/lq-$pkgver"

    cargo build --frozen --release
}

package()
{
    cd "$srcdir/lq-$pkgver"

    install -Dm 755 "target/release/lq" "$pkgdir/usr/bin/lq"
}
