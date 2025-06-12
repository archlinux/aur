# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=hare-clrfmt
pkgver=r4.f1db20c
pkgrel=1
pkgdesc='ANSI escape codes for Hare'
arch=('any')
url='https://git.sr.ht/~blainsmith/hare-clrfmt'
license=('MIT')
depends=('hare')
makedepends=('git')
_commit='f1db20c5df314470cec8494ddc34582ede4e3080'
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
