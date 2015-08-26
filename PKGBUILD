pkgname=libcoap-git
_gitname=libcoap
pkgver=0
pkgrel=1
pkgdesc="C-Implementation of CoAP"
arch=('x86' 'x86_64')
url="https://libcoap.net/"
license=('BSD2')
makedepends=('git')
provides=('libcoap')
conflicts=('libcoap')
source=("$_gitname::git://git.code.sf.net/p/libcoap/code")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  autoconf
  ./configure --prefix="/usr"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
