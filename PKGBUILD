# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=fselect
pkgver=0.10.3
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/jhspetersson/fselect"
license=("MIT")

pkgdesc='Find files with SQL-like queries'

source=("$pkgver.tar.gz::https://github.com/jhspetersson/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('0af1bcb1a8df5ad3a548dbf680c340c72194d136ad9bf878af7754e7b37179bf3fbead48d3a0b86c42ff161aaa32f76e9dceb6160570f03968b2308e2aa2540b')
makedepends=('rust' 'cmake')
depends=('gcc-libs')
conflicts=('fselect-git')
provides=('fselect')
options=('!lto')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    gzip "$srcdir/fselect-$pkgver/docs/fselect.1"
    install -Dm644 "$srcdir/fselect-$pkgver/docs/fselect.1.gz" "$pkgdir/usr/share/man/man1/fselect.1.gz"
    install -Dm755 "$pkgname-$pkgver/target/release/fselect" "$pkgdir/usr/bin/fselect"
    install -Dm644 "$pkgname-$pkgver/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm -f "$srcdir/fselect-$pkgver/docs/fselect.1.gz"
}
