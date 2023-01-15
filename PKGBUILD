# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=libcyusbserial
pkgver=1.0.0
pkgrel=1
pkgdesc="Enable userspace control of Cypress USB-Serial bridge devices"
arch=('i686' 'x86_64')
url="https://github.com/cyrozap/libcyusbserial"
license=('LGPL')
depends=('libusb')
source=("https://github.com/cyrozap/libcyusbserial/archive/v${pkgver}.tar.gz")
sha1sums=('4d28198e7d1777d2770edbdf7161ddde39bac276')
sha256sums=('9887c5aeac7ac266850228be9cff6ef884237413df8c25eb96c29a14b889b14c')

build() {
  cd "${pkgname}-${pkgver}"

  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../

  make
}

package() {
  cd "${pkgname}-${pkgver}/build"

  make DESTDIR="${pkgdir}" install

  if [ -d "${pkgdir}"/usr/lib64 ]; then
    mv "${pkgdir}"/usr/{lib64,lib}
  fi
}
