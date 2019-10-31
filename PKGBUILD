# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

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
sha512sums=('b8bcb31d864376c644f9813abf2d090cc3239271df8a8e71ff7d5e398e993d4d01e94ba5fc1bc13d7dd0fa861b4b918a6df0724ca43f54a5e706ec67f3c7846b')

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
