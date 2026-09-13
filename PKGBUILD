# Maintainer: Sebastian Frysztak <dev dot aur at frysztak dot fastmail dot com>
_pkgname=libbgcode
pkgname=libbgcode-git
pkgver=r234.d4da907
pkgrel=1
pkgdesc="Prusa Block & Binary G-code reader / writer / converter"
url="https://github.com/prusa3d/libbgcode"
license=("AGPL3")
arch=('x86_64')
makedepends=('git')
source=('git+https://github.com/prusa3d/libbgcode.git')
sha256sums=('SKIP')
provides=("libbgcode")
conflicts=("libbgcode")
replaces=("libbgcode<=r234")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgname"

  CMAKE_POLICY_VERSION_MINIMUM=3.5 \
  cmake --preset default \
    -DLibBGCode_BUILD_DEPS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev

  cmake --build --preset default
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${_pkgname}/build-default"
}


# vim:set ts=2 sw=2 et:

