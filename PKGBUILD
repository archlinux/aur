# Maintainer: Whyme Lyu <callme5long@gmail.com>
pkgname=zeal-git
# The author of Zeal hasn't settled on a versioning scheme yet.
# But he's using ``0.0+1snapshot201305312045+0100-1'' on PPA.
# Guess it's safe to use 3-digit for now.
_pkgver=0.0.0
# makepkg will override ``pkgver''
pkgver=0.0.0.83.94b2096
pkgrel=2
pkgdesc="An offline API documentation browser"
arch=('i686', 'x86_64')
url="http://zealdocs.org/"
license=('GPL3')
depends=('qt5-webkit')
makedepends=('git')
_gitname=zeal
source=("git+http://github.com/jkozera/$_gitname")
sha1sums=('SKIP')

pkgver() {
  cd "$_gitname"
  echo "$_pkgver.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$(_full_src_dir)"
  qmake
  make
}

package() {
  cd "$(_full_src_dir)"
  make "INSTALL_ROOT=$pkgdir" install
}

_full_src_dir() {
  echo "$srcdir/$_gitname/zeal"
}

# vim:set ts=2 sw=2 et:
