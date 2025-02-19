# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=whyq
pkgdesc="jq compatible yq implementation in rust"
pkgver=0.12.0
pkgrel=1
url="https://github.com/clux/lq"
arch=("x86_64")
license=("Apache")
depends=("cargo")
source=("https://github.com/clux/lq/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c54a6f12d1e337dbfffb6bbe1c2aa5948d8191eb00515763869a268bc1cfbd54')

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
