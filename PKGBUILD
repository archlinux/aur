# Maintainer: fenugrec

pkgname=gpsim-svn
_pkgname=gpsim
pkgver=r2435
pkgrel=1
pkgdesc="A full-featured software simulator for Microchip PIC microcontrollers"
url="http://gpsim.sourceforge.net"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk2+extra' 'popt')
makedepends=('gputils')
conflicts=("${_pkgname}")

source=("$_pkgname::svn+https://svn.code.sf.net/p/$_pkgname/code/trunk/")
sha256sums=('SKIP')

prepare() {
  cd $_pkgname
  chmod +x autogen.sh
  ./autogen.sh
}

pkgver() {
  cd $_pkgname
  local _ver="$(svnversion)"
  printf "r%s" "${_ver//[[:alpha:]]}"
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
