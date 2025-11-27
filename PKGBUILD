# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Jesin <Jesin00@gmail.com>

pkgname=libb2-git
pkgver=0.98.1.r22.g643decf
pkgrel=1
pkgdesc="C library providing BLAKE2b, BLAKE2s, BLAKE2bp, BLAKE2sp"
arch=('i686' 'x86_64')
url="https://www.blake2.net/"
license=('CC0-1.0')
depends=('gcc-libs' 'glibc')
makedepends=('git')
provides=("libb2=$pkgver" 'libb2.so')
conflicts=('libb2')
options=('staticlibs')
source=("git+https://github.com/BLAKE2/libb2.git")
sha256sums=('SKIP')


pkgver() {
  cd "libb2"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "libb2"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --disable-native \
    --enable-fat
  make
}

check() {
  cd "libb2"

  #make check
}

package() {
  cd "libb2"

  make DESTDIR="$pkgdir" install
}
