# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libdca-git
pkgver=0.0.7.r2.g95c4bd8
pkgrel=1
pkgdesc="A library for decoding DTS Coherent Acoustics streams"
arch=('i686' 'x86_64')
url="https://www.videolan.org/developers/libdca.html"
license=('GPL2')
depends=('glibc')
makedepends=('git')
provides=("libdca=$pkgver")
conflicts=('libdca')
options=('staticlibs')
source=("git+https://code.videolan.org/videolan/libdca.git")
sha256sums=('SKIP')


pkgver() {
  cd "libdca"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libdca"

  ./bootstrap
  ./configure \
    --prefix="/usr"
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
