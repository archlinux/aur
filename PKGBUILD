# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname='dune3d'
pkgname="${_pkgname}-git"
pkgver=r319.507cf4b
pkgrel=1
pkgdesc='3D CAD application'
arch=('x86_64')
url='https://github.com/dune3d/dune3d'
license=('GPL3')
depends=('gtkmm-4.0' 'libepoxy' 'eigen' 'opencascade' 'mimalloc' 'glm' 'range-v3' 'python-gobject' 'python-cairo' 'cairo')
makedepends=('git' 'meson' 'cmake' 'ninja')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git"
        "dune3d.desktop"
)
sha256sums=('SKIP'
            'cf69defe0c737a34c2b45ff9f449e22d47a2d4b45b1ada16f3cd180287939909')

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
  install -Dm644 "$srcdir/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

# vim: ts=2 sw=2 et:
