# Maintainer:  Thomas Weißschuh <thomas t-8ch de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: shamrok <szamrok@gmail.com>

pkgname=kraft
pkgver=0.80
pkgrel=1
pkgdesc="A program suitable for all trades or crafts"
arch=('i686' 'x86_64')
url="http://www.volle-kraft-voraus.de/"
license=('GPL')
depends=('akonadi-contacts' 'ctemplate' 'python-reportlab')
makedepends=('cmake' 'extra-cmake-modules')
source=("https://github.com/dragotin/kraft/archive/v${pkgver}.tar.gz"
        'allow-duplicate-cmake-targets.patch')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -rf build
  mkdir -p build
  cd build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake ".." \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make "DESTDIR=${pkgdir}" install
}

sha256sums=('837e2c0adef85a1aeb36fd16cda48c5e210ef043eb08272b98e7e552a55e1164'
            '2a98be3f535be36161c16ee1f49baba72eab410f222cfc32697c490cfd412370')
