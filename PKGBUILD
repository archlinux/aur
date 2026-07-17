# Maintainer: Thomas <thomas@hummel.link>
pkgname=uolt
pkgver=0.2.0
pkgrel=1
pkgdesc="34 Unix tools in assembly (x86_64/aarch64): no libc, no heap, direct syscalls"
arch=('x86_64' 'aarch64')
url="https://github.com/thooams/uolt"
license=('MIT')
makedepends=('clang' 'binutils')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thooams/uolt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fd227a458be4dea888de824ffef4bcf1fbf68212702f52da73b84c047584724f')

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
