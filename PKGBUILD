# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=cottage-git
pkgver=94f2379
pkgrel=4

pkgdesc="Use howm commands, operators and set configuration values through a UNIX socket."
url="https://github.com/HarveyHunt/cottage"
license=('GPL')
arch=('i686' 'x86_64')

checkdepends=('linux-headers')
options=('debug')
source=("$pkgname::git+https://github.com/HarveyHunt/cottage#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git rev-parse --short HEAD
}

build() {
  cd "$pkgname"
  make debug
}

check() {
  cd "$pkgname"
  find /usr/lib/modules -name checkpatch.pl -print -quit | xargs -i cp {} .

  printf 'spellingtxt||disable\n' > spelling.txt
  make check
}

package() {
  cd "$pkgname"
  install -Dm755 "bin/debug/cottage" "$pkgdir/usr/bin/cottage"
}

# vim:set ts=2 sw=2 et:
