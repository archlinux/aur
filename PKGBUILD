# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=tbt
pkgver=0.9.1
pkgrel=1
pkgdesc='Thunderbolt(TM) user-space components'
arch=('x86_64')
url='https://github.com/01org/thunderbolt-software-user-space'
license=('BSD')
makedepends=('cmake' 'boost' 'txt2tags')
source=("https://github.com/01org/thunderbolt-software-user-space/archive/v${pkgver}.tar.gz")
sha512sums=('7678f190cd85036bb88ef62f2cc6c8aedb84b772f498453d5502b448b99b44f22c2e254781e1e0e28abbc7f7392f8b0732b5cb20f2c445c599d359641689622f')

prepare() {
  cd "${srcdir}/thunderbolt-software-user-space-${pkgver}"
  mkdir -p build
}

build() {
  cd "${srcdir}/thunderbolt-software-user-space-${pkgver}/build"
  cmake .. -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEV_BIN_DIR=/usr/lib/udev/ \
    -DUDEV_RULES_DIR=/usr/lib/udev/rules.d/
  cmake --build .
}

package() {
  cd "${srcdir}/thunderbolt-software-user-space-${pkgver}/build"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/share/doc
}
