# Maintainer: Arsenii Liunsha <mail@arslee.me>

pkgname=hare-nbt
pkgver=r4.af0f70b
pkgrel=1
pkgdesc='NBT support for Hare'
arch=('any')
url='https://git.sr.ht/~arslee07/hare-nbt'
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='af0f70b7f79f8652a7484e30c3a0575ea09a80bc'
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

