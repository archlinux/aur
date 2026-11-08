# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=check-git
pkgver=0.15.2.r71.g35d9cc0
pkgrel=1
pkgdesc="A unit testing framework for C"
arch=('i686' 'x86_64')
url="https://libcheck.github.io/check/"
license=('LGPL-2.1-or-later')
depends=('glibc' 'libgcc' 'gawk')
makedepends=('git')
provides=("check=$pkgver" 'libcheck.so')
conflicts=('check')
options=('staticlibs')
source=("git+https://github.com/libcheck/check.git")
sha256sums=('SKIP')


pkgver() {
  cd "check"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "check"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "check"

  #make check
}

package() {
  cd "check"

  make DESTDIR="$pkgdir" install
}
