# Maintainer: Aaron Mueller <mail@aaron-mueller.de>

pkgname=libgaminggear
pkgver=0.4.0
pkgrel=3
pkgdesc="Provides functionality for gaming input devices"
arch=('i686' 'x86_64')
license=('GPL')
url="http://sourceforge.net/projects/libgaminggear/"
depends=('libnotify' 'libcanberra' 'gtk2' 'sqlite3>=3.7')
makedepends=('cmake>=3.0' 'doxygen')
source=(http://downloads.sourceforge.net/project/libgaminggear/${pkgname}-${pkgver}.tar.bz2)
md5sums=('25d083553a579665f4cd4b5357544c21')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake . -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" install

  if [[ -d "${pkgdir}/usr/share/cmake" ]]; then
     mv ${pkgdir}/usr/share/cmake{,-3.0}
  fi
}
