# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libdvbcsa-git
pkgver=r23.gbc6c0b1
pkgrel=1
pkgdesc="An implementation of the DVB Common Scrambling Algorithm"
arch=('i686' 'x86_64')
url="https://www.videolan.org/developers/libdvbcsa.html"
license=('GPL2')
depends=('glibc')
makedepends=('git')
provides=('libdvbcsa')
conflicts=('libdvbcsa')
options=('staticlibs')
source=("git+https://code.videolan.org/videolan/libdvbcsa.git")
sha256sums=('SKIP')


pkgver() {
  cd "libdvbcsa"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "libdvbcsa"

  ./bootstrap
  ./configure --prefix="/usr"
  make
}

check() {
  cd "libdvbcsa"

  make check
}

package() {
  cd "libdvbcsa"

  make DESTDIR="$pkgdir" install
}
