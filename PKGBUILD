# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-valgrind
pkgver=2.2.1
pkgrel=1
pkgdesc="A cargo subcommand, that runs valgrind and collects its output in a helpful manner"
url="https://github.com/jfrimmel/$pkgname"
arch=("x86_64")
license=("MIT" "Apache")
depends=("cargo" "valgrind")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0f189a7a32d25e5d59665b4ad7fa2a61bdc0f56d2644caa5141def1646837b49')

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
