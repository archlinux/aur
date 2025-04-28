# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=whyq
pkgdesc="jq compatible yq implementation in rust"
pkgver=0.14.0
pkgrel=1
url="https://github.com/clux/lq"
arch=("x86_64")
license=("Apache")
depends=("jq")
makedepends=("cargo")
source=("https://github.com/clux/lq/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('38f4b05cb598a69fcc91ec74a37ce42fe1d7b51c94321932b0e0f520422f072b')

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
