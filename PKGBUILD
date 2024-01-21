# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname='dune3d'
pkgname="${_pkgname}-git"
pkgver=r324.048eff7
pkgrel=1
pkgdesc='3D CAD application'
arch=('x86_64')
url="https://dune3d.org"
license=('GPL3')
depends=('gtkmm-4.0' 'cairomm' 'opencascade' 'eigen' 'libspnav')
makedepends=('glm' 'python3' 'librsvg' 'meson' 'cmake' 'python-gobject' 'python-cairo' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/dune3d/dune3d.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${_pkgname}"
  arch-meson build

  cd build
  ninja
}

package() {
  cd "${_pkgname}/build"
  DESTDIR="$pkgdir" ninja install
}

# vim: ts=2 sw=2 et:
