# Maintainer: Anonymous

pkgname=loiq
pkgver=0.3.1a
pkgrel=5
pkgdesc="Low Orbit Ion Cannon - Qt Edition"
url='http://sourceforge.net/projects/loiq'
arch=('x86_64' 'i686')
source=("http://downloads.sourceforge.net/project/salix-sbo/13.37/loiq/${pkgname}-${pkgver}.tar.bz2")
license=('GPL')
depends=('qt5-base')
md5sums=('74bf705cb96dd2929b02a92bab3e0140')
sha1sums=('a6661fc1b25de36e473bf01823796bc74fe64648')

prepare() {
  mkdir -p build

  sed -e 's|TARGET =|TARGET = loiq|g' \
      -e 's|network|widgets network|g' \
      -i "loiq-${pkgver}/loiq.pro"
  make -C "loiq-${pkgver}" clean
}

build() {
  cd build
  qmake-qt5 "../loiq-${pkgver}"
  make
}

package() {
  install -Dm755 build/loiq "${pkgdir}/usr/bin/loiq"
}
