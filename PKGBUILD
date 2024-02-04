# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-mutants
pkgver=24.2.0
pkgrel=1
pkgdesc='Mutation testing for Rust'
url="https://github.com/sourcefrog/$pkgname"
arch=("x86_64")
license=("MIT")
depends=("cargo")
source=("$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('a6c9fe6860c018e066bdfe78f567328a17e250098f6ede0c8af0333256e4c62f')

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
