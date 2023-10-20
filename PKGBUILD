# Maintainer: Rocket Aaron <i at rocka dot me>
# Contributor: Art Dev <artdevjs at gmail dot com>

_pkgname=klassy
pkgname=${_pkgname}-git
pkgver=4.3.breeze5.27.5.r18.g2482daa3
pkgrel=3
pkgdesc='Klassy is a highly customizable binary Window Decoration and Application Style plugin for recent versions of the KDE Plasma desktop. It provides the Klassy, Kite, Oxygen/Breeze, and Redmond icon styles.'
arch=(x86_64)
url="https://github.com/paulmcauley/klassy"
license=(GPL)
replaces=(classik-git)
depends=(frameworkintegration5 kdecoration breeze-icons kwayland5 kirigami2 hicolor-icon-theme)
makedepends=(git extra-cmake-modules kcmutils5)
optdepends=('kcmutils5: for klassy-settings')
provides=(klassy)
conflicts=(klassy)
source=("${_pkgname}::git+https://github.com/paulmcauley/klassy.git#branch=master")
sha256sums=('SKIP')

pkgver () {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  cmake --build build
}

package() {
  cd "${_pkgname}"
  DESTDIR="${pkgdir}" cmake --install build
}

