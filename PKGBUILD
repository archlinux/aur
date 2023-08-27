# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-deps
pkgver=1.5.1
pkgrel=1
pkgdesc="Cargo subcommand for building dependency graphs of Rust projects"
url="https://github.com/m-cat/$pkgname"
arch=("x86_64")
license=("BSD")
depends=("cargo")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('958e78d8463edf62018d7d5e6f1c5866d59084a4f224c3be01f6eca8a2d3df47')

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
}
