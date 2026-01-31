# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=zen-c
pkgver=0.1.3
pkgrel=2
pkgdesc='Write like a high-level language, run like C.'
url='https://github.com/z-libs/Zen-C'
arch=('x86_64' 'pentium4' 'aarch64' 'armv7h' 'riscv64')
license=('MIT')
optdepends=('gcc: gcc backend support'
    'clang: clang backend support'
    'zig: zig backend support')
makedepends=(gcc make)
provides=(zc)
conflicts=('zen-c-git' 'zen-c-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}b.tar.gz"
    "$pkgname-$pkgver.tar.gz.asc")
sha256sums=('0a17500ed3351fd9e95cffeacb7c55c6d7e0be12c279b56bbf0e944a6fa91e47'
            'SKIP')
validpgpkeys=('EF4B4CB5DFB8822216A473B1597AB12E66262898')

build() {
  cd "Zen-C-${pkgver}b"
  make CC=gcc -j
}

package() {
  cd "Zen-C-${pkgver}b"
  install -Dm755 zc "$pkgdir/usr/bin/zc"
  install -d "$pkgdir/usr/local/share/zenc"
  cp -r std/ "$pkgdir/usr/local/share/zenc/std"
  install -Dm644 std.zc "$pkgdir/usr/local/share/zenc/std.zc"
  install -Dm644 man/zc.1 "$pkgdir/usr/share/man/man1/zc.1"
  install -Dm644 man/zc.5 "$pkgdir/usr/share/man/man5/zc.5"
  install -Dm644 man/zc.7 "$pkgdir/usr/share/man/man7/zc.7"
  command -v gzip >/dev/null 2>&1 && {
      gzip -9 "$pkgdir/usr/share/man/man1/zc.1"
      gzip -9 "$pkgdir/usr/share/man/man5/zc.5"
      gzip -9 "$pkgdir/usr/share/man/man7/zc.7"
  }
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
