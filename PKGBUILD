#Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=bglibs
pkgver=1.106
pkgrel=1
pkgdesc="BG Libraries Collection"
arch=('i686' 'x86_64')
url="http://untroubled.org/bglibs"
license=('LGPL')
depends=('perl')
options=('!libtool')
source=("http://untroubled.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('99bf5936456c7661c329beab63d2b520')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  echo "/usr/lib/bglibs/include" > conf-include
  echo "/usr/lib/bglibs/lib" > conf-lib
  echo "/usr/bin" > conf-bin
  echo "/usr/share/man" > conf-man
  echo "gcc $CFLAGS" > conf-cc
  echo "gcc $LDFLAGS" > conf-ld
  
  make
}
package()
{
  cd ${srcdir}/${pkgname}-${pkgver}
  install -d ${pkgdir}/usr/lib/bglibs
  install_prefix=${pkgdir} make install
  find ${pkgdir}/usr/lib/ -name *.a -exec chmod 644 {} \;
}
# vim: ts=2 sw=2 et ft=sh
