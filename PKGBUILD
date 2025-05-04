# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=cargo-valgrind
pkgver=2.3.1
pkgrel=1
pkgdesc="A cargo subcommand, that runs valgrind and collects its output in a helpful manner"
url="https://github.com/jfrimmel/$pkgname"
arch=("x86_64")
license=("MIT" "Apache")
depends=("cargo" "valgrind")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('88f2e73b621910e81b4fa20a3c6a3c96e0a0fcb2b308a979ec847dc993c05e14')

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
