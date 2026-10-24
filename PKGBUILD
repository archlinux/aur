# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=fselect
pkgver=0.10.4
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/jhspetersson/fselect"
license=("MIT")

pkgdesc='Find files with SQL-like queries'

source=("$pkgver.tar.gz::https://github.com/jhspetersson/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('e726c057a5b041c1e053d1fa3a74a973ed34b58bdb40cae0dcb262acc8c4b0a6e34420645edafda61fbfc7890540736d9a1454c38caa796315f3e594bc91c1e7')
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
