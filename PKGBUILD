# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=digikam
pkgver=1.7.0
pkgrel=1
pkgdesc="Digital photo management application for kde"
arch=('i686' 'x86_64')
license=('GPL')
url="http://digikam.sourceforge.net"
depends=('kdebase-runtime' 'kdegraphics-libs' 'kdepimlibs' 'kdeedu-marble' 'liblqr')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'doxygen')
replaces=('digikamimageplugins')
install=digikam.install
optdepends=('kipi-plugins: for more extras and plugins')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2)

build() {
   cd ${srcdir}
   mkdir build
   cd build
   # use internel lensfun packages
   cmake ../${pkgname}-${pkgver} \
     -DLENSFUN_LIBRARY="" \
     -DLENSFUN_INCLUDE_DIR="" \
     -DCMAKE_INSTALL_PREFIX=/usr \
     -DENABLE_MARBLEWIDGET=yes \
     -DWITH_MarbleWidget=yes \
     -DCMAKE_SKIP_RPATH=ON
   make all
}

package() {
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install
}
md5sums=('ecc6ec563cc5309f21da9c4946397875')
