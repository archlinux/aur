# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=enet-git
pkgver=r254.g0eaf48e
pkgrel=1
pkgdesc="A thin, simple and robust network communication layer on top of UDP"
arch=('i686' 'x86_64')
url="http://enet.bespin.org/"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('enet')
conflicts=('enet')
options=('staticlibs')
source=("git+https://github.com/lsalzman/enet.git")
sha256sums=('SKIP')


pkgver() {
  cd "enet"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "enet"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "enet"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/enet"
}
