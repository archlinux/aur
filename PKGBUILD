# Maintainer: Vaishnav Sabari Girish <vaishnav.sabari.girish@gmail.com>

pkgname=miru-zoom-git
_pkgname=miru
pkgver=r22.a1b2c3 # Dynamically updated by pkgver() below
pkgrel=2
pkgdesc="A Wayland-based zoom daemon and control utility (development branch)"
arch=('x86_64' 'aarch64')
url="https://github.com/Vaishnav-Sabari-Girish/miru"
license=('MIT')
depends=('wayland')
makedepends=('git' 'cmake' 'ninja' 'pkgconf' 'wayland-protocols')
provides=('miru-zoom')
conflicts=('miru-zoom')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -B build -S "${_pkgname}" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
