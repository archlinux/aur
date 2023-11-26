# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-mutants
pkgver=23.11.2
pkgrel=1
pkgdesc='Mutation testing for Rust'
url="https://github.com/sourcefrog/$pkgname"
arch=("x86_64")
license=("MIT")
depends=("cargo")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('b0e564c638b6a8fdd9df34471465094bad4ebef51266787b45b7ab667484c481')

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
