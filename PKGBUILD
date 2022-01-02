# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sysfsutils-git
pkgver=2.1.1.r13.g085bba6
pkgrel=1
pkgdesc="A set of utilities for interfacing with system devices"
arch=('i686' 'x86_64')
url="http://linux-diag.sourceforge.net/Sysfsutils.html"
license=('GPL' 'LGPL')
depends=('glibc')
makedepends=('git')
provides=('sysfsutils')
conflicts=('sysfsutils')
options=('staticlibs')
source=("git+https://github.com/linux-ras/sysfsutils.git")
sha256sums=('SKIP')


pkgver() {
  cd "sysfsutils"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "sysfsutils"

  ./autogen
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "sysfsutils"

  make check
}

package() {
  cd "sysfsutils"

  make DESTDIR="$pkgdir" install
}
