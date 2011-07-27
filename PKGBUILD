# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=digikam
pkgver=1.9.0
pkgrel=2
pkgdesc="Digital photo management application for KDE"
arch=('i686' 'x86_64')
license=('GPL')
url="http://digikam.sourceforge.net"
depends=('kdebase-runtime' 'kdepimlibs' 'liblqr' 'libkexiv2' 'libkipi' 'libkdcraw')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'doxygen')
replaces=('digikamimageplugins')
install=digikam.install
optdepends=('kipi-plugins: for more extras and plugins')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2)

build() {
   cd "${srcdir}"
   mkdir build
   cd build
   # use internel lensfun packages
   cmake ../${pkgname}-${pkgver} \
     -DLENSFUN_LIBRARY="" \
     -DLENSFUN_INCLUDE_DIR="" \
     -DCMAKE_INSTALL_PREFIX=/usr \
     -DCMAKE_SKIP_RPATH=ON
   make all
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
}
md5sums=('08934e97b63e8b1981f4087ec1a3372e')
