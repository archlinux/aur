# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_pkg="Health"
_pkgname="gnome-health"
pkgname="${_pkgname}-git"
pkgver=0.94.0+89+g3023723
_bcver="0.8.1+87cedc2c"
pkgrel=1
pkgdesc="A health tracking app for the GNOME desktop"
arch=(x86_64)
url="https://gitlab.gnome.org/World/${_pkg}"
license=(GPL3)
depends=(
  'libadwaita'
  'rust'
)
makedepends=(
  "blueprint-compiler-health=${_bcver}"
  'git'
  'meson')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+${url}")
b2sums=('SKIP')

pkgver() {
  cd "${_pkg}"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "${_pkg}"
}

build() {
  arch-meson "${_pkg}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
