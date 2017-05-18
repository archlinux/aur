# Maintainer: Javier Tiá <javier.tia at gmail dot com>

pkgname=doctest
pkgver=1.2.0
pkgrel=1
pkgdesc='The lightest feature rich C++ single header testing framework'
arch=('i686' 'x86_64')
url='https://github.com/onqtam/doctest'
license=('MIT')
makedepends=('cmake' 'sed')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('03a02bd0512c4fd778f3bb7794ed9173d37199f110fb8469f490357e3f0bfd68')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release ../
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make
  ctest -C Release --output-on-failure
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 0644 doctest/doctest.h "${pkgdir}/usr/include/doctest.h"
}

# vim:set ft=sh ts=2 sw=2 et:
