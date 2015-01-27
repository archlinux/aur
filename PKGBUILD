# Maintainer: Aaron Mueller <mail@aaron-mueller.de>

pkgname=libgaminggear
pkgver=0.5.0
pkgrel=3
pkgdesc="Provides functionality for gaming input devices"
arch=('i686' 'x86_64')
license=('GPL')
url="http://sourceforge.net/projects/libgaminggear/"
depends=('libnotify' 'libcanberra' 'gtk2' 'sqlite3>=3.7')
makedepends=('cmake>=3.0' 'doxygen')
source=(http://downloads.sourceforge.net/project/libgaminggear/${pkgname}-${pkgver}.tar.bz2
        'find-libgaminggear-cmake.patch')
md5sums=('f6475e8ea0ecfdb2fd4bb468a2e4634b'
         'ea843ae77df9ecf2b33824f2b8cb2980')

prepare() {
    patch $srcdir/$pkgbase-$pkgver/cmake_modules/INSTALL_CMAKE_MODULESDIR.cmake < $srcdir/find-libgaminggear-cmake.patch
}

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
