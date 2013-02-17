# Maintainer: Florian Pritz <bluewind@xinu.at>
_pkgbasename=libidn
pkgname=lib32-$_pkgbasename
pkgver=1.26
pkgrel=1
pkgdesc="Implementation of the Stringprep, Punycode and IDNA specifications (32 bit)"
url="http://www.gnu.org/software/libidn/"
arch=('x86_64')
license=('GPL3' 'LGPL')
depends=('lib32-glibc' "$_pkgbasename>=$pkgver")
makedepends=('gcc-multilib')
options=('!libtool')
source=(http://ftp.gnu.org/gnu/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz)
sha1sums=('b1cb40646a96dadbfc41d060d23dfb382eec1128')

build() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32 CC='gcc -m32'
  make
}

package() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/usr/{bin,include,share}
}
