# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-xml
pkgver=r56.82ad30e
pkgrel=1
pkgdesc='XML support for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-xml'
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='82ad30e1143286417b12b00d45ee1a03330f117e'
source=("$pkgname::git+$url#commit=$_commit")
md5sums=('SKIP')

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
