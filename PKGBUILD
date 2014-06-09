# Maintainer: Aaron Mueller <mail@aaron-mueller.de>

pkgname=libgaminggear
pkgver=0.3.0
pkgrel=1
pkgdesc="Provides functionality for gaming input devices"
arch=('i686' 'x86_64')
license=('GPL')
url="http://sourceforge.net/projects/libgaminggear/"
depends=()
makedepends=('cmake' 'doxygen')
source=(http://downloads.sourceforge.net/project/libgaminggear/${pkgname}-${pkgver}.tar.bz2)
md5sums=('c0210cf4b14e5edaabcf0d7207a97995')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake . -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" install

  if [[ -d "${pkgdir}/usr/share/cmake" ]]; then
     mv ${pkgdir}/usr/share/cmake{,-2.8}
  fi
}
