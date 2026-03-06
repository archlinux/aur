pkgname=mtc
pkgver=0.4.0
pkgrel=2
pkgdesc="C++ compiler for mt-lang"
arch=('x86_64')
url="https://github.com/mystyy01/mt-lang-compiler"
license=('custom:unknown')
depends=('glibc' 'clang')
makedepends=('gcc' 'make' 'git')
source=("$pkgname::git+$url#branch=main")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  make release
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "dist/mtc" "$pkgdir/usr/bin/mtc"

  install -d "$pkgdir/usr/lib/mtc_stdlib"
  cp -a stdlib/. "$pkgdir/usr/lib/mtc_stdlib/"

  install -Dm644 "CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
