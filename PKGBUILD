# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-flash
pkgver=0.18.0
pkgrel=1
pkgdesc="A cargo extension for programming microcontrollers"
url="https://probe.rs/"
arch=("x86_64")
license=("MIT" "Apache")
depends=("cargo")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download" "LICENSE-MIT")
sha256sums=('ae83883ae0a2d3e80d22c903dedceaa948faba5eee2da535da57c522b6f145ed'
            'e9ac8b0c948a4c685b8280dd1a40dbd16bca3a089c9499f123a178725da1a411')

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
    install -Dm 644 "$srcdir/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
