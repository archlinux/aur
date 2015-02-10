# Maintainer: Aaron Mueller <mail@aaron-mueller.de>

pkgname=libgaminggear
pkgver=0.6.0
pkgrel=1
pkgdesc="Provides functionality for gaming input devices"
arch=('i686' 'x86_64')
license=('GPL')
url="http://sourceforge.net/projects/libgaminggear/"
depends=('libnotify' 'libcanberra' 'gtk2' 'sqlite3>=3.7')
makedepends=('cmake>=3.0' 'doxygen')
source=(http://downloads.sourceforge.net/project/libgaminggear/${pkgname}-${pkgver}.tar.bz2)
md5sums=('fe1d7078993ec96b50ee51eee0d6743b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake . -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" install

  if [[ -d "${pkgdir}/usr/share/cmake" ]]; then
     mv ${pkgdir}/usr/share/cmake{,-3.1}
  fi
}
