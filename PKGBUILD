# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname='dune3d'
pkgname="${_pkgname}-git"
pkgver=r8.74eea37
pkgrel=1
pkgdesc='3D CAD application'
arch=('x86_64')
url='https://github.com/dune3d/dune3d'
license=('GPL3')
depends=('gtkmm-4.0' 'libepoxy' 'eigen' 'opencascade' 'mimalloc' 'glm' 'range-v3' 'python-gobject' 'python-cairo' 'cairo')
makedepends=('git' 'meson' 'cmake' 'ninja')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${_pkgname}"
  meson setup build
  meson compile -C build
}

package() {
  cd "${_pkgname}"
  install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim: ts=2 sw=2 et:
