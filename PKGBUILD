# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=sddm-conf
pkgver=0.4.1
pkgrel=1
pkgdesc="Configuration editor for SDDM similar to sddm-config-editor, but written in C++"
arch=('x86_64' 'aarch64')
url="https://github.com/qtilities/sddm-conf"
license=('MIT')
depends=('qt5-base')
makedepends=('cmake' 'qt5-tools' 'qtilitools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0e2af01bcbc92bee3514e4452547bd399cbe2bd02f8a4f9101ea02a15d098627')

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
