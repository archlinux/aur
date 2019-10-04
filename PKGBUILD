# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=doctest
pkgver=2.3.5
pkgrel=1
pkgdesc='The lightest feature rich C++ single header testing framework'
arch=('i686' 'x86_64')
url='https://github.com/onqtam/doctest'
license=('MIT')
makedepends=('cmake')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('71d1ca0916bfea8f4550de196b66f2226f2fdb5fd4a2885a3b4c2dd8f035a8c9')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DDOCTEST_WITH_TESTS=off \
        ../
  make
}

# check() {
  # cd "${srcdir}/${pkgname}-${pkgver}/build"
  # make
  # ctest -C Release --output-on-failure
# }

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm 0644 ../LICENSE.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
