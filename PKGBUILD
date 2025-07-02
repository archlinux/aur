# Maintainer: Sebastian Frysztak <sebastian at frysztak dot dev>
pkgname=libbgcode
pkgver=r228.5041c09
pkgrel=1
pkgdesc="Prusa Block & Binary G-code reader / writer / converter"
url="https://github.com/prusa3d/libbgcode"
license=("AGPL3")
arch=('x86_64')
makedepends=('git')
source=('git+https://github.com/prusa3d/libbgcode.git')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"

  CMAKE_POLICY_VERSION_MINIMUM=3.5 \
  cmake --preset default \
    -DLibBGCode_BUILD_DEPS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev

  cmake --build --preset default
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${pkgname}/build-default"
}


# vim:set ts=2 sw=2 et:

