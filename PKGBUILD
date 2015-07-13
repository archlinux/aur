# Maintainer:  VirtualTam      <virtualtam@flibidi.net>
# Contributor: Deon Spengler   <deon.spengler@gmail.com>
pkgname=gnu-cobol
pkgver=2.0
_pkgsubver=nightly_r411
pkgrel=1
pkgdesc="An open-source COBOL compiler"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/open-cobol/"
license=('GPL')
depends=('db' 'gmp')
options=('!libtool')
install=${pkgname}.install
source=("http://sourceforge.net/projects/open-cobol/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}_${_pkgsubver}.tar.gz"
	"cob-cflags.patch")
md5sums=('f5f761b3dd6c99f94fdca70f753a6fbd' '1ed5d24c0e51f4825e014546c83984c9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  msg "cob-cflags.patch"
  patch -p1 -i ${srcdir}/cob-cflags.patch configure

  ./configure --prefix=/usr --infodir=/usr/share/info
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
