# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=debugedit-git
pkgver=5.1.r3.g971a74d
pkgrel=1
pkgdesc="Provides debugedits and scripts for creating debuginfo and source file distributions"
arch=('i686' 'x86_64')
url="https://sourceware.org/debugedit/"
license=('GPL-3.0-or-later')
depends=('glibc' 'libelf')
makedepends=('git' 'help2man')
optdepends=('bash')
provides=("debugedit=$pkgver")
conflicts=('debugedit')
source=("git+https://sourceware.org/git/debugedit.git")
sha256sums=('SKIP')


pkgver() {
  cd "debugedit"

  _tag=$(git tag -l --sort -v:refname | grep -E '^debugedit-?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^debugedit-//'
}

build() {
  cd "debugedit"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "debugedit"

  #make check
}

package() {
  cd "debugedit"

  make DESTDIR="$pkgdir" install
}
