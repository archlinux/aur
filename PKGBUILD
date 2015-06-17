# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
pkgname=openorienteering-mapper
pkgver=0.5.96
pkgrel=1
pkgdesc="Orienteering map drawing software"
arch=('i686' 'x86_64')
url="http://oorienteering.sourceforge.net/?page_id=103"
license=('GPL3')
depends=('qt5-tools>=5.3.2' 'polyclipping>=6.1.3a' 'proj>=4.8.0')
makedepends=('cmake>=2.8.9')
install=${pkgname}.install
source=("http://sourceforge.net/projects/oorienteering/files/Mapper/Source/${pkgname}_${pkgver}-src.tgz")
sha256sums=('8d76213183bc1b69c9121a649397986eba8fc3a07ece1c5747a4748cdf881e04')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  rm -rf ${srcdir}/${pkgname}-${pkgver}/build
  mkdir -p ${srcdir}/${pkgname}-${pkgver}/build
  cd ${srcdir}/${pkgname}-${pkgver}/build

  cmake ..                      \
    -DCMAKE_BUILD_TYPE=Release  \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMapper_BUILD_QT=0         \
    -DMapper_BUILD_CLIPPER=0    \
    -DMapper_BUILD_PROJ=0       \
    -Wno-dev
  make -j2
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build

  make DESTDIR=${pkgdir}/ install
  rm -fr ${pkgdir}/DEBIAN
}
