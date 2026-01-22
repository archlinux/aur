# Maintainer: artist for Artix Linux and XLibre <artist@artixlinux.org>

pkgname=webappcontainer-git
_pkgname="${pkgname%-*}"
pkgver=1.3.1.r0.b52b341
pkgrel=1
pkgdesc="Open any web app in this single, light weight, portable application with a tray icon."
arch=(x86_64)
url="https://github.com/josephcrowell/${_pkgname}"
license=('LGPL-2.0-or-later')
depends=(
  qt6-base
  qt6-svg
  qt6-webengine
)
makedepends=(cmake clang qt6-tools git)
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("git+${url}.git")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${_pkgname}"

  mkdir build && cd build

  cmake ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  DESTDIR=$pkgdir cmake --install build

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
sha256sums=('SKIP')
