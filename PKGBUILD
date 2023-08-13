# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=remmina-plugin-exec
pkgver=1.2.3.0
pkgrel=2
_builderver=1.4.31.0
pkgdesc="A protocol plugin for Remmina to execute an external process."
arch=('x86_64')
url="http://www.muflone.com/${pkgname}/"
license=('GPL')
depends=('gtk3' 'remmina' 'hicolor-icon-theme')
makedepends=('pkg-config' 'cmake')
source=("remmina-plugin-builder_${_builderver}.tar.gz::https://github.com/muflone/remmina-plugin-builder/archive/${_builderver}.tar.gz"
        "${pkgname}_${pkgver}.tar.gz::https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('276dfe06d64c0c5f2cfeafe878ed9c70147f97a2af36399ac5260a91c5600588'
            '041fe1584e9ba3d5930fd2ebf4af26645d618adc7f6998c51144be39dbb804f6')

build() {
  [ -d build ] && rm -rf build
  cp -r "remmina-plugin-builder-${_builderver}" build
  cp -r "${pkgname}-${pkgver}"/* "build/remmina-plugin-to-build"
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DREMMINA_VER_1_1=OFF .
  make
}

package() {
  cd "${srcdir}/build/"
  make DESTDIR="${pkgdir}" install
}
