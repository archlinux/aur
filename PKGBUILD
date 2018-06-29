# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=bglibs
pkgver=2.04
pkgrel=1
pkgdesc="BG Libraries Collection"
arch=('i686' 'x86_64')
url="http://untroubled.org/bglibs"
license=('LGPL')
depends=('perl')
source=("http://untroubled.org/bglibs/archive/${pkgname}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('D0B7C8DD365DA39529DA2E2AE96FB2DC699980E8')
md5sums=('6da684a3d1ef38d517d2c8b0ca33534a'
         'SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  echo "/usr/bin" > conf-bin
  echo "/usr/include" > conf-include
  echo "/usr/lib" > conf-lib
  echo "/usr/share/man" > conf-man
  sed -i "1s/\$/ $(echo -n $CFLAGS | sed 's/[\/&]/\\&/g')/" conf-cc
  sed -i "1s/\$/ $(echo -n $LDFLAGS | sed 's/[\/&]/\\&/g')/" conf-ld

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install_prefix="${pkgdir}" make install
}
