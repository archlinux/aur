# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-valgrind
pkgver=2.2.0
pkgrel=1
pkgdesc="A cargo subcommand, that runs valgrind and collects its output in a helpful manner"
url="https://github.com/jfrimmel/$pkgname"
arch=("x86_64")
license=("MIT" "Apache")
depends=("cargo" "valgrind")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3a8d7c44e638e380ba83d8cbbe013e22a71cb2dea1f8ebcc0f293744f387f9f0')

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
