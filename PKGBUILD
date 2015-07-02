# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=libpano13-hg
pkgver=826.7339b1014e88
pkgrel=1
pkgdesc="Basic library to calculate panoramical pictures - core functions of the panotools"
url="http://panotools.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libpng' 'libtiff')
makedepends=('mercurial' 'cmake')
provides=('libpano13')
conflicts=('libpano13')
options=(!libtool)
source=('hg+http://hg.code.sf.net/p/panotools/libpano13')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/libpano13"
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd "$srcdir/libpano13"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "$srcdir/libpano13"
  make DESTDIR="$pkgdir" install
}
