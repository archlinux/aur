# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-json
pkgver=r34.ba8506a
pkgrel=1
pkgdesc='JSON support for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-json'
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='ba8506a2b67aeb53018ae1ed2c031cf89f41f0ec'
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
