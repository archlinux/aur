# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=sddm-conf
pkgver=0.3.0
pkgrel=1
pkgdesc="Configuration editor for SDDM similar to sddm-config-editor, but written in C++"
arch=('x86_64')
url="https://github.com/qtilities/sddm-conf"
license=('MIT')
depends=('qt5-base')
makedepends=('cmake' 'qt5-tools' 'qtilitools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d7ff3c814fbee20128c3f55896deb658c877f33f769ccfbd271e8dd68e3bfbe9')

prepare() {
    sed -i 's|VERSION 0.2.0|VERSION 0.3.0|' ${pkgname}-${pkgver}/CMakeLists.txt
}

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
