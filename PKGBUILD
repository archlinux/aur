# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

_pkgname=ratox
pkgname=$_pkgname-git
pkgver=0.3.0.452
pkgrel=1
pkgdesc="FIFO based tox client"
arch=('i686' 'x86_64')
url="http://git.z3bra.org/ratox/log.html"
license=('custom')
depends=('toxcore')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+git://git.z3bra.org/ratox")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  echo $(grep "^VERSION =" config.mk | cut -d " " -f3).0.$(git rev-list --count HEAD)
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
