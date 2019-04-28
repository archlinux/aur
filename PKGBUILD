# Maintainer: Maxime Gauduin <alucryd@archinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix@gmail.com>
# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>

pkgname=libechonest
pkgver=2.3.1
pkgrel=2
pkgdesc='C++ library for interfacing with Echo Nest'
arch=('x86_64')
url='https://projects.kde.org/projects/playground/libs/libechonest'
license=('GPL')
depends=('gcc-libs' 'glibc' 'qjson' 'qt4')
makedepends=('cmake')
source=("http://files.lfranchi.com/libechonest-${pkgver}.tar.bz2")
sha256sums=('56756545fd1cb3d9067479f52215b6157c1ced2bc82b895e72fdcd9bebb47889')


prepare() {
  cd libechonest-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd libechonest-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DECHONEST_BUILD_TESTS='False'
  make
}

package() {
  cd libechonest-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
