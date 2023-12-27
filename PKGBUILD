# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Leonard de Ruijter <alderuijter@gmail.com>
# Contributor: Matthias Grosser <mtgrosser at gmx dot net>

pkgname=shine-git
pkgver=3.1.1.r59.gab5e352
pkgrel=1
pkgdesc="Super fast fixed-point MP3 encoder"
arch=('i686' 'x86_64')
url="https://github.com/toots/shine"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('git')
provides=("shine=$pkgver")
conflicts=('shine')
options=('staticlibs')
source=("git+https://github.com/toots/shine.git")
sha256sums=('SKIP')


pkgver() {
  cd "shine"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "shine"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "shine"

  make check
}

package() {
  cd "shine"

  make DESTDIR="$pkgdir" install
}
