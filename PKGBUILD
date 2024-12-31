# Maintainer: KorigamiK <korigamik@gmail.com>
_pkgname=focusclock
pkgname="${_pkgname}-git"
pkgver=r7.82fc878
pkgrel=1
pkgdesc="A clock that sits on top of all windows to help you focus."
arch=("x86_64" "i686" "aarch64" "armv7h" "armv6h")
url="https://github.com/KorigamiK/focusclock"
license=("GPL3")
depends=("gtk4-layer-shell" "gtkmm-4.0")
makedepends=("cmake" "git")
provides=("focusclock")
conflicts=("focusclock")
source=("git+https://github.com/KorigamiK/focusclock.git")
sha512sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "${srcdir}/${_pkgname}" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
