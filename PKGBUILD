# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cunit-svn
pkgver=r170
pkgrel=1
pkgdesc="A unit testing framework for C"
arch=('i686' 'x86_64')
url="https://cunit.sourceforge.net/"
license=('LGPL')
depends=('glibc')
makedepends=('subversion' 'libtool')
provides=("cunit=$pkgver")
conflicts=('cunit')
options=('staticlibs')
source=("svn+https://svn.code.sf.net/p/cunit/code/trunk")
sha256sums=('SKIP')


pkgver() {
  cd "trunk"

  _ver="$(svnversion)"
  printf "r%s" "${_ver//[[:alpha:]]}"
}

build() {
  cd "trunk"

  ./bootstrap
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
