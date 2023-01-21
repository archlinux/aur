# Maintainer: Alexander Rowsell <amrowsell followed by frozenelectronics dot canadian tld>
pkgname=ueforth-git
_pkgname=ueforth
pkgver=r673.6ed9c21
pkgrel=1
pkgdesc="An EForth inspired version of Forth bootstrapped from a minimalist C kernel"
arch=('x86_64')
url="https://eforth.appspot.com/linux.html"
license=('Apache')
provides=('ueforth')
conflicts=('ueforth-bin')
source=("git+https://github.com/flagxor/ueforth.git")
depends=('gcc-libs' 'glibc')
makedepends=('nodejs')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i -e '1s/nodejs/node/' tools/source_to_string.js
  sed -i -e '96s/nodejs/node/' Makefile
}

build() {
  cd "$srcdir/$_pkgname"
  make posix
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/usr/bin/"
  install -m755 "out/posix/$_pkgname" "$pkgdir/usr/bin"
}
