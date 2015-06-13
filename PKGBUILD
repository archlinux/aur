# Maintainer: Muflone <webreg@vbsimple.net>

pkgname=remmina-plugin-ultravnc
pkgver=1.1.1.0
pkgrel=2
_builderver=1.1.0.0
pkgdesc="A protocol plugin for Remmina to connect via VNC using UltraVNC viewer."
arch=('i686' 'x86_64')
url="http://www.muflone.com/${pkgname}/"
license=('GPL')
depends=('gtk3' 'remmina' 'ultravnc-viewer')
makedepends=('pkg-config' 'cmake')
install="${pkgname}.install"
source=("remmina-plugin-builder_${_builderver}.tar.gz::https://github.com/muflone/remmina-plugin-builder/archive/${_builderver}.tar.gz"
        "${pkgname}_${pkgver}.tar.gz::https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0d41d50731ae25dfa1e66394cfa489d598cf491d36dbaf44d72ad921589e0960'
            '7e64521bb30205585766c61529cb6d835f3faad780eb30b3841b8011cfe0af72')

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
