# Maintainer: Vaishnav Sabari Girish <vaishnav.sabari.girish@gmail.com>

pkgname=miru-zoom-git
_pkgname=miru
pkgver=r154.30f2b83
pkgrel=1
pkgdesc="A Wayland-based zoom daemon and control utility (development branch)"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/Vaishnav-Sabari-Girish/miru"
license=('MIT')
depends=('wayland' 'mesa' 'libffi')
makedepends=('cmake' 'ninja' 'pkgconf' 'wayland-protocols' 'git')
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
  cmake --install build --prefix "${pkgdir}/usr"
}
