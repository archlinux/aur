# based on libfreefare PKGBUILD by James Buckley
pkgname=libfreefare-git
pkgver=0.3.5.r441.g14219ab
pkgrel=1
pkgdesc='Provides a convenient API for MIFARE card manipulations'
arch=('i686' 'x86_64')
url='http://code.google.com/p/nfc-tools/'
license=('LGPL3')
depends=('libnfc>=1.7.0')
makedepends=('git')
provides=('libfreefare')
conflicts=('libfreefare')
source=('git+https://code.google.com/p/libfreefare/')
sha256sums=('SKIP')

_gitname=libfreefare

pkgver() {
  cd "$srcdir/$_gitname"
  printf "%s.r%s.g%s" "$(grep AC_INIT configure.ac | sed -E 's/.*\[([0-9.]+)\].*/\1/g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"

  msg "Starting make..."
  autoreconf -vis
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
