# Maintainer: Goldbro233 bowensun_06@outlook.com
pkgname=zigfetch
pkgver=0.27.1
pkgrel=1
pkgdesc='Minimal neofetch/fastfetch-like system information tool written in Zig'
arch=('x86_64')
url='https://github.com/utox39/zigfetch'
license=('MIT')
depends=('pciutils')
makedepends=('zig')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8568efea2ec305513124978bbaf6db82b2293e9a0f8952d0d36a786bab57f90b')

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
