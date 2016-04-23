# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=remmina-plugin-rdesktop
pkgver=1.2.3.0
pkgrel=1
_builderver=1.2.3.0
pkgdesc="A protocol plugin for Remmina to open a RDP connection with rdesktop."
arch=('i686' 'x86_64')
url="http://www.muflone.com/${pkgname}/"
license=('GPL')
depends=('gtk3' 'remmina' 'rdesktop')
makedepends=('pkg-config' 'cmake')
install="${pkgname}.install"
source=("remmina-plugin-builder_${_builderver}.tar.gz::https://github.com/muflone/remmina-plugin-builder/archive/${_builderver}.tar.gz"
        "${pkgname}_${pkgver}.tar.gz::https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a36bfd9f97f462ba3af024e9a8e84df26bc6bed87281db9b6a24f2630f4deb56'
            'f4981aa2ace3b1c029c480b4d701491db621e6ce2a4399c4918185d0e7fc088a')

prepare() {
  msg2 'To build for Remmina < 1.2 set -DREMMINA_VER_1_1=ON'
}

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
