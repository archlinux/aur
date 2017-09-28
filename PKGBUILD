# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=tbt
pkgver=0.9.2
pkgrel=1
pkgdesc='Thunderbolt(TM) user-space components'
arch=('x86_64')
url='https://github.com/01org/thunderbolt-software-user-space'
license=('BSD')
makedepends=('cmake' 'boost' 'txt2tags')
source=("https://github.com/01org/thunderbolt-software-user-space/archive/v${pkgver}.tar.gz")
sha512sums=('fbd5902f3f06d3cfec309a972fe5dc32e87eab39668b2c07401bd79ad9af2210f8db41ecdd30cfae34ba24b03dc47df439c2fcd2e74da55d1101237f723b4540')

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
