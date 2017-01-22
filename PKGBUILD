# based on libfreefare PKGBUILD by James Buckley
pkgname=libfreefare-git
pkgver=0.4.0.r507.g295104a
pkgrel=1
pkgdesc='A convenience API for NFC cards manipulations on top of libnfc'
arch=('i686' 'x86_64')
url='http://nfc-tools.org/index.php?title=Libfreefare'
license=('LGPL3')
depends=('libnfc>=1.7.0')
makedepends=('git')
provides=('libfreefare')
conflicts=('libfreefare')
source=('git+https://github.com/nfc-tools/libfreefare.git')
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
