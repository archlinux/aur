# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libigloo-git
pkgver=0.9.5.r0.g1a4f575
pkgrel=1
pkgdesc="A generic C framework used by the Icecast project"
arch=('i686' 'x86_64')
url="https://gitlab.xiph.org/xiph/icecast-libigloo"
license=('GPL-2.0-or-later')
depends=('glibc' 'librhash.so')
makedepends=('git' 'rhash')
provides=("libigloo=$pkgver" 'libigloo.so')
conflicts=('libigloo')
options=('staticlibs')
source=("git+https://gitlab.xiph.org/xiph/icecast-libigloo.git")
sha256sums=('SKIP')


pkgver() {
  cd "icecast-libigloo"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "icecast-libigloo"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "icecast-libigloo"

  #make check
}

package() {
  cd "icecast-libigloo"

  make DESTDIR="$pkgdir" install
}
