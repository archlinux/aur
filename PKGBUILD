# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=whyq
pkgver=0.10.2
pkgrel=1
pkgdesc="jq compatible yq implementation in rust"
url="https://github.com/clux/$pkgname"
arch=("x86_64")
license=("Apache")
depends=("cargo")
source=("https://github.com/clux/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8c93edc117e5ac0fa4d3a04d35c007b590071d1d845d353b946a3333a661453c')

prepare()
{
    cd "$srcdir/$pkgname-$pkgver"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build()
{
    cd "$srcdir/$pkgname-$pkgver"

    cargo build --frozen --release
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm 755 "target/release/yq" "$pkgdir/usr/bin/yq"
}
