# Maintainer: Eric Toombs <IRC user triteraflops>

pkgname=hare-ev
pkgver=r42.c585f01
pkgrel=1
pkgdesc='Event loop for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-ev'
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='c585f01f4d13a25edb62477c07fdf32451417fee'
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
