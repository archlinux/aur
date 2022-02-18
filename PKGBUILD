# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gengen-git
pkgver=1.4.3.r0.g82470d4
pkgrel=1
pkgdesc="\"Text generator\" generator"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gengen/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('git')
provides=('gengen')
conflicts=('gengen')
source=("git+https://git.savannah.gnu.org/git/gengen.git")
sha256sums=('SKIP')


pkgver() {
  cd "gengen"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^rel_//;s/_/./g'
}

build() {
  cd "gengen"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make || true
}

check() {
  cd "gengen"

  make check
}

package() {
  cd "gengen"

  make DESTDIR="$pkgdir" install
}
