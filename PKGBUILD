# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=microserver
pkgver=0.2.1
pkgrel=2
pkgdesc="Simple ad-hoc server with SPA support based on Warp!. Excellent for testing React, Angular, Vue apps and the like."
url="https://github.com/robertohuertasm/$pkgname"
arch=("x86_64")
license=("MIT" "Apache")
depends=("cargo" "valgrind")
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('9a2b4acf0db61717f1c57376a9f660c27ac485d3d47effc6febda2af67be6ac7')

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
