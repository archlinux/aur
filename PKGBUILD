# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=fselect
pkgver=0.9.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/jhspetersson/fselect"
license=("MIT")

pkgdesc='Find files with SQL-like queries'

source=("$pkgver.tar.gz::https://github.com/jhspetersson/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('9047c8421647bad9f458a07d1597ec688fa2fab8f543e328fe16fd6c4763e07fa9f5d71ba59e228b88c52effc265897cef52ac20c5a8a594ef3fdec65b8099a0')
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
