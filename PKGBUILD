# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=quickjs-git
pkgver=r491.ga38171d
pkgrel=1
pkgdesc="A small and embeddable Javascript engine"
arch=('i686' 'x86_64')
url="https://bellard.org/quickjs/"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=("quickjs=$pkgver")
conflicts=('quickjs')
options=('staticlibs')
source=("git+https://github.com/bellard/quickjs.git")
sha256sums=('SKIP')


pkgver() {
  cd "quickjs"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

check() {
  cd "quickjs"

  #make test
}

package() {
  cd "quickjs"

  make \
    PREFIX="/usr" \
    DESTDIR="$pkgdir" \
    install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/quickjs"
}
