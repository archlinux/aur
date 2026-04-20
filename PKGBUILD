# Maintainer: Eslam Allam <eslamallam73@gmail.com>
pkgname=logitune-git
_pkgname=logitune
pkgver=v0.3.1.beta.1.r5.330b2b0 # This will be updated by the pkgver() function
pkgrel=1
pkgdesc="Configure Logitech devices on Linux (Options+ clone)"
arch=('x86_64')
url="https://github.com/mmaher88/logitune"
license=('GPL3')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-5compat' 'libudev0-shim')
makedepends=('git' 'cmake' 'ninja' 'qt6-tools' 'gtest')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${pkgname}" \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
