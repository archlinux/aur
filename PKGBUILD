# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

_pkgname=umbrielpng
pkgname=$_pkgname-git
pkgver=0.1.c54.cdf6925
pkgrel=1
pkgdesc='PNG chunk analyzer and modifier'
arch=(x86_64)
url=https://github.com/Traneptora/umbrielpng
license=(BSD-3-Clause)
depends=(
  zlib
)
makedepends=(
  git
  gcc
)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url.git)
sha256sums=(SKIP)

pkgver() {
  cd $_pkgname
  printf %s.c%s.%s \
    $(grep -m1 '@version' umbrielpng.c | awk '{print $3}') \
    $(git rev-list --count HEAD) \
    $(git rev-parse --short HEAD)
}

build() {
  cd $_pkgname
  gcc $CFLAGS -c umbrielpng.c
  gcc $LDFLAGS -o umbrielpng umbrielpng.o -lz
}

package() {
  install -Dvm755 $_pkgname/umbrielpng -t "$pkgdir/usr/bin"
  install -Dm644 $_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
