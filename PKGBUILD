# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-godot
pkgver=0.3.0
pkgrel=1
pkgdesc="Cargo helper to improve godot rust developement experience."
url="https://github.com/sanpii/$pkgname"
arch=("x86_64")
license=("MIT")
depends=("cargo")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('b75a3bf3bc7a97602233d7554ea2a3fc451ccc647decbc6323181a20538c328b')

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
