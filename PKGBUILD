# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gnu-netcat-svn
pkgver=r370
pkgrel=1
pkgdesc="A networking utility which reads and writes data across network connections"
arch=('i686' 'x86_64')
url="https://netcat.sourceforge.net/"
license=('GPL')
depends=('glibc')
makedepends=('subversion' 'texinfo')
provides=("gnu-netcat=$pkgver" 'netcat')
conflicts=('gnu-netcat')
replaces=('netcat')
source=("svn+https://svn.code.sf.net/p/netcat/code/trunk")
sha256sums=('SKIP')


pkgver() {
  cd "trunk"

  _ver="$(svnversion)"
  printf "r%s" "${_ver//[[:alpha:]]}"
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
