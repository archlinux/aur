# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=whyq
pkgdesc="jq compatible yq implementation in rust"
pkgver=0.15.0
pkgrel=1
url="https://github.com/clux/lq"
arch=("x86_64")
license=("Apache")
depends=("jq")
makedepends=("cargo")
source=("https://github.com/clux/lq/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2659514e0910f2345532745dc3c8999b610460ed999288f63e40ddaf4a7ed809')

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
