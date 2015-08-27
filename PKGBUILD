# Maintainer: Samuel Ace Winchenbach <swinchen at gmail dot com>
pkgname=avarice-svn
_pkgname=avarice
pkgrel=1
pkgver=20150713.350
pkgdesc="AVaRICE is a program for interfacing the Atmel JTAG ICE to GDB to allow users to debug their embedded AVR target."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/avarice/"
license=('GPL')
groups=()
depends=(libusb-compat)
makedepends=(svn)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::svn+http://svn.code.sf.net/p/avarice/code/trunk")
noextract=()
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}/${_pkgname}"
  ./Bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}/${_pkgname}"

  make DESTDIR="$pkgdir/" install
}
pkgver() {
  cd "${srcdir}/${pkgname}"
  svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
}
