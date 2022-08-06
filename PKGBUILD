# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-ssh
pkgver=r69.ec25df7
pkgrel=1
pkgdesc='SSH library for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-ssh'
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='ec25df752665d10a3b47714b6cf63db2c54366cd'
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
