# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=cottage-git
_pkgname=cottage
pkgver=94f2379
pkgrel=4

pkgdesc="Use howm commands, operators and set configuration values through a UNIX socket."
arch=('i686' 'x86_64')
url="https://github.com/HarveyHunt/cottage"
license=('GPL')

checkdepends=('linux-headers')
options=('!strip' 'debug')
source=("git+https://github.com/HarveyHunt/cottage#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git rev-parse --short HEAD
}

build() {
  cd "$_pkgname"
  make debug
}

check() {
  cd "$_pkgname"
  find /usr/lib/modules -name checkpatch.pl -print -quit | xargs -i cp {} .

  echo "spellingtxt||getoutofmyface" > spelling.txt
  make check
}

package() {
  cd "$_pkgname"
  install -Dm755 "bin/debug/cottage" "$pkgdir/usr/bin/cottage"
}

# vim:set ts=2 sw=2 et:
