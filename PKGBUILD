# Maintainer: Samuel Ace Winchenbach <swinchen at gmail dot com>
pkgname=avrdude-svn
_pkgname=avrdude
pkgrel=1
pkgver=20190105.1429
pkgdesc="AVRDUDE is an utility to download/upload/manipulate the ROM and EEPROM contents of AVR microcontrollers using the in-system programming technique (ISP)."
arch=(i686 x86_64 armv6h armv7h)
url="http://www.nongnu.org/avrdude/"
license=('GPL')
groups=()
depends=('libftdi' 'libusb-compat' 'hidapi')
makedepends=(svn)
optdepends=('elfutils')
provides=('avrdude')
conflicts=('avrdude' 'avrdude-osuisp2-svn')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::svn+http://svn.savannah.nongnu.org/svn/avrdude/trunk")
noextract=()
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}/${_pkgname}"
  ./bootstrap
  ./configure --mandir=/usr/share/man \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-linuxgpio
  make
}

package() {
  cd "${srcdir}/${pkgname}/${_pkgname}"

  make DESTDIR="${pkgdir}/" install
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
}
