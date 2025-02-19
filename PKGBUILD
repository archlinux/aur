# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=whyq
pkgdesc="jq compatible yq implementation in rust"
pkgver=0.12.2
pkgrel=1
url="https://github.com/clux/lq"
arch=("x86_64")
license=("Apache")
depends=("cargo")
source=("https://github.com/clux/lq/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a174cc8b70224d093286413e36d62d557349b330303f50e3ec2282f8372f5e5d')

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
