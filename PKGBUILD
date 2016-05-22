# Maintainer: Javier Tiá <javier.tia at gmail dot com>

pkgname=doctest
pkgver=1.0.0
pkgrel=1
pkgdesc='The lightest feature rich C++ single header testing framework'
arch=('i686' 'x86_64')
url="https://github.com/onqtam/doctest"
license=('MIT')
makedepends=('cmake' 'sed')
options=('!libtool')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('855a463b2721b99d350f9198e436236a1efac633cbaf9f8d7e16f0a57f16fb94')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's|\ COMMAND\ python|&2|' examples/range_based_execution/CMakeLists.txt
  sed -i 's|\r||' doctest/doctest.h
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
