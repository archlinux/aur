# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libisofs-git
pkgver=1.5.4.r7.g1c4c04d
pkgrel=1
pkgdesc="Library to create an ISO-9660 filesystem"
arch=('i686' 'x86_64')
url="https://dev.lovelyhq.com/libburnia/web/wiki/Libisofs"
license=('GPL')
depends=('glibc' 'acl' 'zlib')
makedepends=('git')
provides=('libisofs')
conflicts=('libisofs')
options=('staticlibs')
source=("git+https://dev.lovelyhq.com/libburnia/libisofs.git")
sha256sums=('SKIP')


pkgver() {
  cd "libisofs"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d;/^v/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^release-//;s/-/./g'
}

build() {
  cd "libisofs"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libisofs"

  make check
}

package() {
  cd "libisofs"

  make DESTDIR="$pkgdir" install
}
