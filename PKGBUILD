# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=remmina-plugin-rdesktop
pkgver=1.2.0.0
pkgrel=1
_builderver=1.2.0.0
pkgdesc="A protocol plugin for Remmina to open a RDP connection with rdesktop."
arch=('i686' 'x86_64')
url="http://www.muflone.com/${pkgname}/"
license=('GPL')
depends=('gtk3' 'remmina' 'rdesktop')
makedepends=('pkg-config' 'cmake')
install="${pkgname}.install"
source=("remmina-plugin-builder_${_builderver}.tar.gz::https://github.com/muflone/remmina-plugin-builder/archive/${_builderver}.tar.gz"
        "${pkgname}_${pkgver}.tar.gz::https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c3cb8201943b00d7475922055a68dd86ec163a01e1f578aae32427ab2427121e'
            '6c93e29319caf691499a3ce579313763922f0d2f57041bec54579a9ef2e59c95')

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
