# Maintainer: Tim Jester-Pfadt <t.jp(at)gmx.de>

pkgname=valgrind-mmt-git
pkgver=11210.d16304e
pkgrel=1
pkgdesc="Valgrind with mmt tool to trace application accesses to mmaped memory"
arch=('i686' 'x86_64')
url="https://github.com/envytools/valgrind.git"
license=('GPL')
conflicts=(valgrind)
replaces=(valgrind)
depends=('perl')
options=('staticlibs' '!emptydirs')
source=('git+https://github.com/envytools/valgrind.git' )
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/valgrind
  echo $(git rev-list --count mmt-3.10).$(git rev-parse --short mmt-3.10)
}

prepare() {
  git clone https://github.com/envytools/VEX.git "$srcdir"/valgrind/VEX
  cd "$srcdir"/valgrind/VEX
  git checkout -f VEX_3_10_BRANCH
  cd ..
  git checkout -f mmt-3.10
}

build() {
  cd "$srcdir"/valgrind
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/valgrind
  make DESTDIR="$pkgdir" install
}


