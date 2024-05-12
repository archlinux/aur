# Maintainer: Arsenii Liunsha <mail@arslee.me>

pkgname=hare-nbt
pkgver=r2.c3b3c08
pkgrel=1
pkgdesc='NBT support for Hare'
arch=('any')
url='https://git.sr.ht/~arslee07/hare-nbt'
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='c3b3c08b5a4ba7c68a0bf5a8927955373e003dfd'
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

