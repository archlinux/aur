# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=nerdfix
pkgver=0.3.1
pkgrel=1
pkgdesc="nerdfix helps you to find/fix obsolete Nerd Font icons in your project."
url="https://github.com/loichyan/$pkgname"
arch=("x86_64")
license=("MIT" "Apache")
makedepends=("cargo")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c1e4264db7de66666c5ddd73b90d7aa32fe5e7afd8a2eb8fe781288e84f93f27')

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

check()
{
    cd "$srcdir/$pkgname-$pkgver"

    cargo test --frozen
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm 644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
