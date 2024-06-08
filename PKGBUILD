# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=xxhash-git
pkgver=0.8.2.r106.gac3a25d
pkgrel=1
pkgdesc="Extremely fast non-cryptographic hash algorithm"
arch=('i686' 'x86_64')
url="https://cyan4973.github.io/xxHash/"
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('git')
checkdepends=('valgrind')
provides=("xxhash=$pkgver")
conflicts=('xxhash')
source=("git+https://github.com/Cyan4973/xxHash.git")
sha256sums=('SKIP')


pkgver() {
  cd "xxHash"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "xxHash"

  make
}

check() {
  cd "xxHash"

  #make test
}

package() {
  cd "xxHash"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/xxhash"
}
