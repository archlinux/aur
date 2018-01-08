# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libdca-git
pkgver=r100.g76c67bc
pkgrel=1
pkgdesc="A library for decoding DTS Coherent Acoustics streams"
arch=('i686' 'x86_64')
url="https://www.videolan.org/developers/libdca.html"
license=('GPL2')
depends=('glibc')
makedepends=('git')
provides=('libdca')
conflicts=('libdca')
options=('staticlibs')
source=("git+https://code.videolan.org/videolan/libdca.git")
sha256sums=('SKIP')


pkgver() {
  cd "libdca"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "libdca"

  ./bootstrap
  ./configure --prefix="/usr"
  make
}

check() {
  cd "libdca"

  make check
}

package() {
  cd "libdca"

  make DESTDIR="$pkgdir" install
}
