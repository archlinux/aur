# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=chrpath-git
pkgver=0.17.r2.g594b5ff
pkgrel=1
pkgdesc="Tool to adjust the RPATH or RUNPATH of ELF binaries"
arch=('i686' 'x86_64')
url="https://codeberg.org/pere/chrpath"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('git')
provides=("chrpath=$pkgver")
conflicts=('chrpath')
source=("git+https://codeberg.org/pere/chrpath.git")
sha256sums=('SKIP')


pkgver() {
  cd "chrpath"

  _tag=$(git tag -l --sort -v:refname | grep -E '^release-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^release-//'
}

build() {
  cd "chrpath"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "chrpath"

  make DESTDIR="$pkgdir" docdir="/usr/share/doc/chrpath" install
}
