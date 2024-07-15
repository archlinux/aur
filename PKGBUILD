# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=hare-ev
pkgver=r73.ed023be
pkgrel=1
pkgdesc='Event loop for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-ev'
license=('MPL-2.0')
depends=('hare')
makedepends=('git')
_commit='ed023beb4b4db88e22f608aa001682ac18cad230'
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
