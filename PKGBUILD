# Maintainer: Jimmy Aguilar  <spacibba@yandex.com>
# Contributor: VirtualTam    <virtualtam@flibidi.net>
# Contributor: Deon Spengler <deon.spengler@gmail.com>

pkgname=gnu-cobol
_pkgmaj=2.2
_pkgmin=
_tarname="gnucobol-${_pkgmaj}${_pkgmin}"

pkgver="${_pkgmaj}${_pkgmin}"
pkgrel=2
pkgdesc="The open source GNU COBOL compiler"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/open-cobol/"
license=('GPL')
depends=('db' 'gmp')
makedepends=('gcc' 'help2man')
options=('!libtool')
source=("http://sourceforge.net/projects/open-cobol/files/${pkgname}/${_pkgmaj}/${_tarname}.tar.xz"
	"cob-cflags.patch")
md5sums=('a96dd83d0ad96b2013317b66538d5fab'
         '1ed5d24c0e51f4825e014546c83984c9')

build() {
  cd "${srcdir}/${_tarname}"

  msg "cob-cflags.patch"
  patch -p1 -i ${srcdir}/cob-cflags.patch configure

  ./configure --prefix=/usr --infodir=/usr/share/info
  make
}

package() {
  cd "${srcdir}/${_tarname}"
  make DESTDIR="${pkgdir}" install
}
