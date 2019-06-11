pkgname=libcoap-git
_gitname=libcoap
pkgver=r1628.a5ffdf3
pkgrel=2
pkgdesc="C-Implementation of CoAP"
arch=('x86' 'x86_64')
url="https://libcoap.net/"
license=('BSD2' 'GPL2')
makedepends=('git' 'doxygen' 'asciidoc')
provides=('libcoap')
conflicts=('libcoap')
source=("$_gitname::git://github.com/obgm/libcoap.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
