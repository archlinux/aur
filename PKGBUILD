# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=m4-git
pkgver=1.4.19.r994.gd69fa528
pkgrel=1
pkgdesc="The GNU macro processor"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/m4/m4.html"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'gettext' 'gperf' 'help2man' 'rsync' 'texinfo')
provides=("m4=$pkgver")
conflicts=('m4')
source=("git+https://git.savannah.gnu.org/git/m4.git#branch=branch-2.0")
sha256sums=('SKIP')


pkgver() {
  cd "m4"

  _tag=$(git tag -l --sort -creatordate | grep -E '^v?[0-9\.]+' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "m4"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "m4"

  #make check
}

package() {
  cd "m4"

  make DESTDIR="$pkgdir" install
}
