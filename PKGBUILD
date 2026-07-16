# Maintainer: Thomas <thomas@hummel.link>
pkgname=uolt
pkgver=0.1.0
pkgrel=1
pkgdesc="34 Unix tools in x86_64 assembly: no libc, no heap, direct syscalls"
arch=('x86_64')
url="https://github.com/thooams/uolt"
license=('MIT')
makedepends=('clang' 'binutils')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thooams/uolt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9cfdbdefa998abff76ad3e58f8dce1102ae3632b38568c2a6d4458cdb4d21520')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -dm755 "$pkgdir/usr/bin"
    for f in build/uolt-*; do
        install -m755 "$f" "$pkgdir/usr/bin/$(basename "$f")"
    done
    # `[` is the same binary as `test`.
    ln -s uolt-test "$pkgdir/usr/bin/uolt-["
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
