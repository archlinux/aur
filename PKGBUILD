# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=libpgm-git
pkgver=5.3.128.r11.gcf6cebed
pkgrel=1
pkgdesc="Library implementing the PGM reliable multicast network protocol"
arch=('i686' 'x86_64')
url="https://github.com/steve-o/openpgm"
license=('LGPL-2.1-or-later')
depends=('glibc')
makedepends=('git' 'python')
provides=("libpgm=$pkgver")
conflicts=('libpgm')
options=('staticlibs')
source=("git+https://github.com/steve-o/openpgm.git")
sha256sums=('SKIP')


pkgver() {
  cd "openpgm"

  _tag=$(git tag -l --sort -v:refname | /usr/bin/grep -E '^release-[0-9-]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^release-//;s/-/./g'
}

build() {
  cd "openpgm/openpgm/pgm"

  ./bootstrap.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "openpgm/openpgm/pgm"

  #make check
}

package() {
  cd "openpgm/openpgm/pgm"

  make DESTDIR="$pkgdir" install
}
