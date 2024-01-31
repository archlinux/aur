# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=digitd
pkgver=r12.e06aa4a
pkgrel=1
pkgdesc='Finger client & server'
arch=('any')
url='https://git.sr.ht/~sircmpwn/digitd'
license=('GPL-3.0-or-later')
depends=('hare-ev')
makedepends=('git' 'scdoc')
_commit='e06aa4a69eba4430689a33a3777c43665b1d931c'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')


pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"

  # remove '-Wl,' prefix if present, since it is only required when
  # the linker is invoked indirectly. Keeping it will cause the linker to
  # fail.
  export LDFLAGS=${LDFLAGS#"-Wl,"}

  make all docs
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}
