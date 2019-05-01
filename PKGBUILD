# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libdnet-git
pkgver=1.12.r20.g54a0c14
pkgrel=1
pkgdesc="A simplified, portable interface to several low-level networking routines"
arch=('i686' 'x86_64')
url="https://github.com/dugsong/libdnet"
license=('BSD')
depends=('glibc' 'sh')
makedepends=('git')
provides=('libdnet')
conflicts=('libdnet')
options=('staticlibs')
source=("git+https://github.com/dugsong/libdnet.git")
sha256sums=('SKIP')


pkgver() {
  cd "libdnet"

  _tag=$(git tag -l --sort -v:refname | sed -n '1,1{s/libdnet-//p}')
  _rev=$(git rev-list --count libdnet-$_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
}

build() {
  cd "libdnet"

  autoconf
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --mandir="/usr/share/man"
  make
}

package() {
  cd "libdnet"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/libdnet/LICENSE"
}
