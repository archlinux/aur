# Maintainer: Deon Spengler <deon[at]spengler[dot]co[dot]za>
pkgname=libdfuprog-git
pkgdesc="libdfuprog is a fork of dfu-programmer built as a dynamic library"
pkgver=v0.7.0.r46.g15d3d92
pkgrel=1
arch=('x86_64')
url="https://github.com/EspoTek/libdfuprog"
license=('GPL2')
depends=('libusb')
provides=('libdfuprog')
conflicts=('libdfuprog')
source=(git+https://github.com/EspoTek/libdfuprog)
sha256sums=('SKIP')

pkgver() {
  cd libdfuprog
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/libdfuprog
  ./bootstrap.sh
  chmod +x libdfuprog_make_linux
  ./libdfuprog_make_linux
}

package() {
  install -D -m 0644 ${srcdir}/libdfuprog/src/libdfuprog-0.9.so \
                     ${pkgdir}/usr/lib/libdfuprog-0.9.so

  install -D -m 0644 ${srcdir}/libdfuprog/src/main.h \
                     ${pkgdir}/usr/include/libdfuprog.h
}
