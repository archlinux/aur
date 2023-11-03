# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=jaq
pkgver=1.1.1
pkgrel=1
pkgdesc="jaq is a clone of the JSON data processing tool jq. jaq aims to support a large subset of jq's syntax and operations."
url="https://github.com/01mf02/$pkgname"
arch=("x86_64")
license=("MIT")
makedepends=("cargo")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('0969ff3f149354cd94326d8c1eac199be53127506ef6e5b823ae4e44c092ce44')

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
    install -Dm 644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
