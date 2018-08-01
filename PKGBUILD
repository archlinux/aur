# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=vmir
pkgver=0.1
pkgrel=2
pkgdesc='Execute .wasm files directly'
arch=('x86_64')
url='https://github.com/andoma/vmir'
license=('MIT')
makedepends=('clang' 'git')
source=("git+https://github.com/andoma/vmir.git#commit=b8aebf545cbf570c9e4367cf8f162db457c06bc0"
        'wasm.conf')
sha256sums=('SKIP'
            'b10ca7ae90b202b0e1ffb72cfcdd06a5ab9e304b60ee9831854879c0950bf90c')

prepare() {
  sed -i \
    's,Need .bc file to parse/run,Please provide a .wasm file as the first argument.,g' \
    "$pkgname/src/main.c"
}

build() {
  CC=clang make -C "$pkgname"
}

package() {
  cd "$pkgname"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/wasm.conf" "$pkgdir/etc/binfmt.d/wasm.conf"
}

# vim: ts=2 sw=2 et:
