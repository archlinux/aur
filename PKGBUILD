# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=sddm-conf
pkgver=0.2.0
pkgrel=1
pkgdesc="Configuration editor for SDDM similar to sddm-config-editor, but written in C++"
arch=('x86_64')
url="https://github.com/qtilities/sddm-conf"
license=('MIT')
depends=('qt5-base')
makedepends=('cmake' 'qt5-tools' 'qtilitools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('875723553afc9fd850697d359dc1434b4ce978aab3dcc6d6ff66914dc71857e1')

build() {
  mkdir -p build && cd build
  cmake ../${pkgname}-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}/" install
  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
