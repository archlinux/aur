# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=whyq
pkgdesc="jq compatible yq implementation in rust"
pkgver=0.13.0
pkgrel=3
url="https://github.com/clux/lq"
arch=("x86_64")
license=("Apache")
depends=("jq")
makedepends=("cargo")
source=("https://github.com/clux/lq/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d6ff3e7d5dfb3fe538aa00ac42610113d506cbd9fc745379eec650d01275b97a')

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
