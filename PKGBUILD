# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dejagnu-git
pkgver=1.6.1.r1.gfb6ef60
pkgrel=1
pkgdesc="A framework for testing other programs"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/dejagnu/"
license=('GPL3')
depends=('expect' 'sh')
makedepends=('git')
provides=('dejagnu')
conflicts=('dejagnu')
source=("git+https://git.savannah.gnu.org/git/dejagnu.git")
sha256sums=('SKIP')


pkgver() {
  cd "dejagnu"

  _tag=$(git tag -l --sort -v:refname | grep -m1 dejagnu- | sed 's/dejagnu-//;s/-release//')
  _rev=$(git rev-list --count dejagnu-$_tag-release..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
}

build() {
  cd "dejagnu"

  ./configure --prefix="/usr"
  make
}

check() {
  cd "dejagnu"

  make check
}

package() {
  cd "dejagnu"

  make DESTDIR="$pkgdir" install
}
