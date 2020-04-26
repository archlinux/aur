# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=tbt
pkgver=0.9.3
pkgrel=2
pkgdesc='Thunderbolt(TM) user-space components'
arch=('x86_64')
url='https://github.com/01org/thunderbolt-software-user-space'
license=('BSD')
depends=('boost-libs')
makedepends=('cmake' 'boost' 'txt2tags')
source=("https://github.com/01org/thunderbolt-software-user-space/archive/v${pkgver}.tar.gz")
b2sums=('afc614d0d2f7de3c23988e08c0053d24a04be51d22986497e3863b76ad59f1a8a9e2ab323210df27a3fa2f07ab05122666a3c6bfde146250f0854b2dfb6748f8')

prepare() {
  mkdir -p  thunderbolt-software-user-space-${pkgver}/build
}

build() {
  cd thunderbolt-software-user-space-${pkgver}/build
  cmake .. -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEV_BIN_DIR=/usr/lib/udev/ \
    -DUDEV_RULES_DIR=/usr/lib/udev/rules.d/
  cmake --build .
}

package() {
  cd thunderbolt-software-user-space-${pkgver}/build
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/share/doc
}
