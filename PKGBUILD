# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='typewriter'
pkgname="${_pkgname}-git"
pkgver=r46.7ad6b18
pkgrel=1
pkgdesc='Minimal writer with autosave'
arch=('x86_64')
url='https://github.com/manexim/typewriter'
license=('GPL3')
depends=('granite' 'gtksourceview3')
makedepends=('git' 'meson' 'vala')
provides=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
