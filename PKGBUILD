# Maintainer: Goldbro233 bowensun_06@outlook.com
pkgname=zigfetch
pkgver=0.30.0
pkgrel=1
pkgdesc='Minimal neofetch/fastfetch-like system information tool written in Zig'
arch=('x86_64')
url='https://github.com/utox39/zigfetch'
license=('MIT')
depends=('pciutils')
makedepends=('zig')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('84da4559072d3c6f37c5875b56359e37c098a8cc7972c9b0bb5d40b7761f5026')

build() {
    export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache"
    export ZIG_LOCAL_CACHE_DIR="$srcdir/zig-cache-local"

    cd "$srcdir/$pkgname-$pkgver"
    zig build -Doptimize=ReleaseSafe
}

check() {
    export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-cache"
    export ZIG_LOCAL_CACHE_DIR="$srcdir/zig-cache-local"

    cd "$srcdir/$pkgname-$pkgver"
    zig build test
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 zig-out/bin/zigfetch "$pkgdir/usr/bin/zigfetch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 config.json "$pkgdir/usr/share/doc/$pkgname/examples/config.json"
}
