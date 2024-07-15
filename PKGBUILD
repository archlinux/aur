# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-xml
pkgver=r61.2d51166
pkgrel=1
pkgdesc='XML support for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-xml'
license=('MPL-2.0')
depends=('hare')
makedepends=('git')
_commit='2d51166ea9cbd59487db2f759c1d67bff8106d71'
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
