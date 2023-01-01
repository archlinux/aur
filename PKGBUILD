# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=proot-termux
pkgver=r187.5c462a6
pkgrel=1
pkgdesc="A copy of the PRoot project with patches applied to work better under Termux."
arch=('x86_64')
url="https://github.com/termux/proot"
license=('GPL')
depends=('talloc')
makedepends=('git')
checkdepends=('valgrind')
provides=('proot')
conflicts=('proot')
_commit=5c462a6ecfddd629b1439f38fbb61216d6fcb359
source=("git+https://github.com/termux/proot.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/proot"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/proot"
  make -C src
}

# Tests seem to go on perpetually

#check() {
#  cd "$srcdir/proot"
#  env LD_SHOW_AUXV=1 true
#  cat /proc/cpuinfo
#  ./src/proot -V
#  ./src/proot -v 1 true
#  make -C tests
#}

package() {
  cd "$srcdir/proot"
  make -C src install PREFIX="$pkgdir/usr"

  install -Dm644 doc/proot/man.1 "$pkgdir/usr/share/man/man1/proot.1"
}
