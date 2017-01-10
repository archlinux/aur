# Maintainer:  VirtualTam      <virtualtam@flibidi.net>
# Contributor: Deon Spengler   <deon.spengler@gmail.com>
pkgname=gnu-cobol
pkgver=2.0rc2
_pkgmaj=2.0
_pkgmin=rc-2
pkgrel=1
pkgdesc="An open-source COBOL compiler"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/open-cobol/"
license=('GPL')
depends=('db' 'gmp')
options=('!libtool')
source=("http://sourceforge.net/projects/open-cobol/files/${pkgname}/${_pkgmaj}/${pkgname}-${_pkgmaj}_${_pkgmin}.tar.gz"
	"cob-cflags.patch")
md5sums=('e604d8c81fc83c29768bcb3c98b8d215'
         '1ed5d24c0e51f4825e014546c83984c9')

build() {
  cd "${srcdir}/${pkgname}-${_pkgmaj}"

  msg "cob-cflags.patch"
  patch -p1 -i ${srcdir}/cob-cflags.patch configure

  ./configure --prefix=/usr --infodir=/usr/share/info
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgmaj}"
  make DESTDIR="${pkgdir}" install
}
