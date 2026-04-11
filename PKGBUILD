# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=fselect
pkgver=0.10.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/jhspetersson/fselect"
license=("MIT")

pkgdesc='Find files with SQL-like queries'

source=("$pkgver.tar.gz::https://github.com/jhspetersson/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('5657bde1e55720e780d3961deb4fa5ae4c21e3eb104dc61d538ca64c2189ff44e95883a2c66b154ca4a2d5ca0871d8d77a95bb12abcf3e9c862d86013f4091b2')
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
