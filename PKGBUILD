# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=zlob
pkgver=1.2.9
pkgrel=1
pkgdesc='A fast SIMD-accelerated glob pattern matcher'
url='https://github.com/dmtrKovalenko/zlob'
arch=('x86_64')
license=('MIT')
makedepends=('zig')
provides=('zlob' 'libzlob.so')
conflicts=('zlob-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgname_$pkgver.tar.gz")
sha256sums=('5bb833431d829835cb90123d1ca158eb186ef6f413a327dbc53c5a73c736f67c')

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
