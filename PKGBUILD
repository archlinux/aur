# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=whyq
pkgver=0.11.1
pkgrel=1
pkgdesc="jq compatible yq implementation in rust"
url="https://github.com/clux/$pkgname"
arch=("x86_64")
license=("Apache")
depends=("cargo")
source=("https://github.com/clux/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cb6b8ae61bc3a619b9eb649003dfb08f758e6f6a8c149585d0ddaef1f2a2df55')

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

    install -Dm 755 "target/release/whyq" "$pkgdir/usr/bin/whyq"
}
