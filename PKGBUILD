# Maintainer: Jenya Sovetkin <e dot sovetkin at gmail dot com>
pkgname=tudu-git
pkgver=r273.700cd21
pkgrel=1
pkgdesc="ncurses-based hierarchical todo list manager with vim-like keybindings"
arch=('i686' 'x86_64')
url="https://gitlab.com/tudu/tudu.git"
license=('GPL')
depends=('ncurses')
makedepends=('git' 'gcc')
provides=('tudu')
conflicts=('tudu')
replaces=()
backup=()
options=()
install=
source=('git+https://gitlab.com/tudu/tudu.git')
noextract=()
md5sums=('SKIP')

_gitname=tudu

pkgver() {
  cd "${srcdir}/${_gitname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd "$srcdir/$_gitname"

  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$_gitname"

  make DESTDIR=$pkgdir install
  install -vDm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
