# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=zlob
pkgver=1.3.0
pkgrel=2
pkgdesc='A fast SIMD-accelerated glob pattern matcher'
url='https://github.com/dmtrKovalenko/zlob'
arch=('x86_64')
license=('MIT')
makedepends=('zig')
provides=('zlob' 'libzlob.so')
conflicts=('zlob-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('97c785b186fbd6a52205a990b84c3f437132add63c16ea1e2e1925a3e44df772')

build() {
    cd "$pkgname-$pkgver"
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 zig-out/bin/zlob "$pkgdir/usr/bin/zlob"
    install -Dm644 zig-out/include/zlob.h ${pkgdir}/usr/include/zlob.h
    install -Dm644 zig-out/lib/libzlob.so ${pkgdir}/usr/lib/libzlob.so
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=4 sw=4 et:
