pkgname=mkdev
pkgver=3.3.0
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

    MANPAGE=true target/release/mk
    for manfile in mkdev-man/*.1; do
        install -Dm644 "$manfile" "$pkgdir/usr/share/man/man1/$(basename "$manfile")"
    done
}
