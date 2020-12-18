# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=glpk-git
pkgver=r275.g4e03800
pkgrel=1
pkgdesc="GNU Linear Programming Kit: solve LP, MIP and other problems"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/glpk/"
license=('GPL')
depends=('glibc' 'gmp')
makedepends=('git')
provides=('glpk')
conflicts=('glpk')
options=('staticlibs')
source=("git+https://salsa.debian.org/science-team/glpk.git")
sha256sums=('SKIP')


pkgver() {
  cd "glpk"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "glpk"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --with-gmp
  make
}

check() {
  cd "glpk"

  make check
}

package() {
  cd "glpk"

  make DESTDIR="$pkgdir" install
  install -Dm644 doc/{glpk,gmpl}.pdf -t "$pkgdir/usr/share/doc/glpk"
}
