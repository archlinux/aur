# Maintainer:  VirtualTam      <virtualtam@flibidi.net>
# Contributor: Deon Spengler   <deon.spengler@gmail.com>
# Contributor: Jimmy Aguilar   <spacibba@yandex.com>

pkgname=gnu-cobol
_pkgmaj=2.2
_pkgmin=rc
_tarname=gnucobol

pkgver="${_pkgmaj}${_pkgmin}"
pkgrel=1
pkgdesc="An open-source COBOL compiler"

arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/open-cobol/"
license=('GPL')
depends=('db' 'gmp' 'help2man')
options=('!libtool')
source=("http://sourceforge.net/projects/open-cobol/files/${pkgname}/${_pkgmaj}/${_tarname}-${_pkgmaj}-${_pkgmin}.tar.gz"
	"cob-cflags.patch")
md5sums=('95daec84e72034d4c1bcf216e0ebc34a'
         '1ed5d24c0e51f4825e014546c83984c9')

build() {
  cd "${srcdir}/${_tarname}-${_pkgmaj}-${_pkgmin}"

  msg "cob-cflags.patch"
  patch -p1 -i ${srcdir}/cob-cflags.patch configure

  ./configure --prefix=/usr --infodir=/usr/share/info
  make
}

package() {
  cd "${srcdir}/${_tarname}-${_pkgmaj}-${_pkgmin}"
  make DESTDIR="${pkgdir}" install
}
