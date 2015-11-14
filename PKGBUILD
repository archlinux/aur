# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=remmina-plugin-exec
pkgver=1.2.1.0
pkgrel=1
_builderver=1.2.1.0
pkgdesc="A protocol plugin for Remmina to execute an external process."
arch=('i686' 'x86_64')
url="http://www.muflone.com/${pkgname}/"
license=('GPL')
depends=('gtk3' 'remmina')
makedepends=('pkg-config' 'cmake')
install="${pkgname}.install"
source=("remmina-plugin-builder_${_builderver}.tar.gz::https://github.com/muflone/remmina-plugin-builder/archive/${_builderver}.tar.gz"
        "${pkgname}_${pkgver}.tar.gz::https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('bf2a289f30f1176d3eb1ffd33bfeeaa80b5efd68562eb254a16d1c97337f016b'
            'eb3333b9de924922b619f0c88e911cbd91b5cbba99d95e0e732e28965a7c72b8')

build() {
  [ -d build ] && rm -rf build
  cp -r "remmina-plugin-builder-${_builderver}" build
  cp -r "${pkgname}-${pkgver}"/* "build/remmina-plugin-to-build"
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/build/"
  make DESTDIR="${pkgdir}" install
}
