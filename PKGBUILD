# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-brief
pkgver=0.2.0
pkgrel=2
pkgdesc="Display a brief summary of cargo dependencies."
url="https://github.com/sanpii/$pkgname"
arch=("x86_64")
license=("MIT")
depends=("cargo")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('47bd62ecd5f9f550daa2bd13e40197b477b569ed46605bf08d4396aa67ea4321')

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

    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
