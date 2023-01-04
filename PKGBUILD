# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dwz-git
pkgver=0.15.r0.g449844d
pkgrel=1
pkgdesc="A DWARF optimization and duplicate removal tool"
arch=('i686' 'x86_64')
url="https://sourceware.org/dwz/"
license=('GPL')
depends=('glibc' 'libelf')
makedepends=('git' 'xxhash')
checkdepends=('dejagnu')
provides=("dwz=$pkgver")
conflicts=('dwz')
source=("git+https://sourceware.org/git/dwz.git")
sha256sums=('SKIP')


pkgver() {
  cd "dwz"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^dwz-//'
}

build() {
  cd "dwz"

  make CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"
}

check() {
  cd "dwz"

  make check
}

package() {
  cd "dwz"

  make DESTDIR="$pkgdir" install
}
