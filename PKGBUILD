# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-ssh
pkgver=r36.e33ffce
pkgrel=1
pkgdesc='SSH library for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-ssh'
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='e33ffce51a9a5062959f6fa3d6fa51e52e13c490'
source=("$pkgname::git+$url#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"

  sed \
    -i Makefile \
    -e 's/install -m644/cp -vr/g'
}
check() {
  cd "$pkgname"

  make check
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}
