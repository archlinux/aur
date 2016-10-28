# Maintainer: Marco Kundt <mrckndt@gmail.com>

pkgname=cgdb-git
pkgver=r1124.415c978
pkgrel=1
pkgdesc="Curses-based interface to the GNU Debugger"
arch=('i686' 'x86_64')
url="http://cgdb.sourceforge.net/"
license=('GPL')
depends=('readline>=5.1' 'ncurses' 'gdb')
makedepends=('help2man' 'autoconf')
conflicts=('cgdb')
source=(git+https://github.com/cgdb/cgdb)

md5sums=('SKIP')

_gitname='cgdb'

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_gitname}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_gitname}
  make DESTDIR="${pkgdir}/" install
}
