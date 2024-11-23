# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=nerdfix
pkgver=0.4.2
pkgrel=1
pkgdesc="nerdfix helps you to find/fix obsolete Nerd Font icons in your project."
url="https://github.com/loichyan/$pkgname"
arch=("x86_64")
license=("MIT" "Apache")
makedepends=("cargo")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e56f648db6bfa9a08d4b2adbf3862362ff66010f32c80dc076c0c674b36efd3c')

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
