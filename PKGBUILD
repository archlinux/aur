# Maintainer: SoftExpert <softexpert at gmail dot com>

_pkgname=crystal-dock
pkgname=${_pkgname}-git
pkgver=r107.g5e7f337
pkgrel=1
arch=(x86_64)
pkgdesc='A cool desktop panel for Linux desktop'
arch=('x86_64')
url='https://github.com/dangvd/crystal-dock'
license=('GPL3')
provides=(crystal-dock)
conflicts=(crystal-dock)
depends=(qt5-base kwin)
makedepends=(cmake git extra-cmake-modules kcmutils)
source=("${_pkgname}::git+https://github.com/dangvd/crystal-dock.git")
sha256sums=('SKIP')

pkgver(){
  cd "${srcdir}/${_pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build
  cd build
  cmake  \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    ../src
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" cmake --install build
}

# vim:set ts=8 sts=2 sw=2 et:
