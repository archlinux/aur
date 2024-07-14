# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=nerdfix
pkgver=0.4.1
pkgrel=1
pkgdesc="nerdfix helps you to find/fix obsolete Nerd Font icons in your project."
url="https://github.com/loichyan/$pkgname"
arch=("x86_64")
license=("MIT" "Apache")
makedepends=("cargo")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('37f13ccf0eb6567b31862bc46e694a60177cbf5b76667fe73f22cef8f7ea68df')

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
