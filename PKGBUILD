# Maintainer: envolution
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Tiago Santos <ircalf at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=libjwt
pkgver=3.2.1
pkgrel=2
pkgdesc="JWT C Library"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/benmcollins/libjwt"
license=('MPL-2.0')
depends=('jansson' 'openssl' 'gnutls' 'mbedtls')
checkdepends=('check')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/benmcollins/libjwt/archive/v${pkgver}.tar.gz")
sha256sums=('900b89695dc4da96629778d3713c8194d99ca12c8b585af0306badecfa4cbcf8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DWITH_PKGCONFIG=ON \
    -DBUILD_SHARED_LIBS=ON \
    -Wno-dev
  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
