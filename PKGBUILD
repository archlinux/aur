# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=hare-clrfmt
pkgver=r1.b980bef
pkgrel=1
pkgdesc='ANSI escape codes for Hare'
arch=('any')
url='https://git.sr.ht/~blainsmith/hare-clrfmt'
license=('MIT')
depends=('hare')
makedepends=('git')
_commit='b980bef3a365721647ddedbbeacc20ac38b47f70'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "$pkgname"

  # remove '-Wl,' prefix if present, since it is only required when
  # the linker is invoked indirectly. Keeping it will cause the linker to
  # fail.
  export LDFLAGS=${LDFLAGS#"-Wl,"}

  make check
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}
