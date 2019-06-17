# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=libpgm-git
pkgver=r1232.fcc46a11
pkgrel=1
pkgdesc="OpenPGM: implementation of the Pragmatic General Multicast (PGM, RFC3208)"
arch=('x86_64')
url='https://www.freshports.org/net/openpgm/'
license=('LGPL2.1')
depends=('glibc')
makedepends=('python2')
_name=openpgm
provides=('libpgm')
conflicts=('libpgm')
source=("git+https://github.com/steve-o/openpgm.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_name/openpgm/pgm"
  find . -type f -exec sed -i 's/python/python2/g' {} \+
}

build() {
  cd "$srcdir/$_name/openpgm/pgm"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_name/openpgm/pgm"
  make prefix="$pkgdir/usr" install
}
