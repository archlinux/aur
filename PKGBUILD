# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gnu-netcat-svn
pkgver=r370
pkgrel=3
pkgdesc="A networking utility which reads and writes data across network connections"
arch=('i686' 'x86_64')
url="https://netcat.sourceforge.net/"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('subversion' 'texinfo')
provides=("gnu-netcat=$pkgver" 'netcat')
conflicts=('gnu-netcat')
source=("svn+https://svn.code.sf.net/p/netcat/code/trunk")
sha256sums=('SKIP')


pkgver() {
  cd "trunk"

  _rev="$(svnversion | sed 's/[^0-9]+//')"
  printf "r%s" "$_rev"
}

build() {
  cd "trunk"

  autoreconf -fi
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "trunk"

  make check
}

package() {
  cd "trunk"

  make DESTDIR="$pkgdir" install
}
