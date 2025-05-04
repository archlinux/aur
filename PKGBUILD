pkgname=mkdev
pkgver=3.2.2
pkgrel=1
pkgdesc="Save your boilerplate instead of writing it."
arch=('x86_64')
url="https://github.com/4jamesccraven/mkdev"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/4jamesccraven/mkdev/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')


build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}


package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 "target/release/mk" "$pkgdir/usr/bin/mk"

    MANPAGE=true target/release/mk > mk.1
    install -Dm644 mk.1 "$pkgdir/usr/share/man/man1/mk.1"
}
