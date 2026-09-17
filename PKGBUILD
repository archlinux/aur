# Maintainer: artist for Artix Linux and XLibre <artist@artixlinux.org>

pkgname=webappcontainer
pkgver=2.0.2
pkgrel=1
pkgdesc="Open any web app in this single, light weight, portable application with a tray icon."
arch=(x86_64)
url="https://github.com/josephcrowell/${pkgname}"
license=('LGPL-2.0-or-later')
depends=(
  qt6-base
  qt6-svg
  qt6-webengine
)
makedepends=(cmake clang dpkg qt6-tools git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/josephcrowell/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir build && cd build

  cmake ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

sha256sums=('0a0048b803bde6b3848798bb61e9c2268f123e9b99f71bbeab7aeae5112de8ec')
