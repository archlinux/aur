# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=proot-termux
pkgver=r187.5c462a6
pkgrel=2
pkgdesc="A copy of the PRoot project with patches applied to work better under Termux."
arch=('x86_64')
url="https://github.com/termux/proot"
license=('GPL-2.0-or-later')
depends=('talloc')
makedepends=('git')
checkdepends=('valgrind')
provides=('proot')
conflicts=('proot')
_commit=5c462a6ecfddd629b1439f38fbb61216d6fcb359
source=("git+https://github.com/termux/proot.git#commit=${_commit}")
sha256sums=('5c7d6407ad68e219d8038e8dd472ba82a50b570df995b6bd6ebdb6ef4a63aa93')

pkgver() {
  cd proot
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd proot
  make -C src
}

# Tests seem to go on perpetually

#check() {
#  cd proot
#  env LD_SHOW_AUXV=1 true
#  cat /proc/cpuinfo
#  ./src/proot -V
#  ./src/proot -v 1 true
#  make -C tests
#}

package() {
  cd proot
  make -C src install PREFIX="$pkgdir/usr"

  install -Dm644 doc/proot/man.1 "$pkgdir/usr/share/man/man1/proot.1"
}
