# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=sddm-conf
pkgver=0.1.0
pkgrel=1
pkgdesc="Configuration editor for SDDM similar to sddm-config-editor, but written in C++"
arch=('x86_64')
url="https://github.com/qtilities/sddm-conf"
license=('MIT')
depends=('qt5-base')
makedepends=('cmake' 'qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/0.1.0.tar.gz")
sha256sums=('9847ca7b714cf4ca0e92bb9e43760ee74bb6cc4245eb7f344ea8d1191aac26f3')

build() {
  mkdir -p build && cd build
  cmake ../${pkgname}-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}/" install
  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
