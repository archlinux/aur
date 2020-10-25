# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='typewriter'
pkgname="${_pkgname}-git"
pkgver=r56.eacdb73
pkgrel=1
pkgdesc='Minimal writer with autosave'
arch=('x86_64')
url='https://github.com/manexim/typewriter'
license=('GPL3')
depends=('granite' 'gtksourceview3')
makedepends=('git' 'meson' 'vala')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson "${_pkgname}" 'build'
  meson compile -C 'build'
}

package() {
  DESTDIR="${pkgdir}" meson install -C 'build'
  install -Dvm644 "${_pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

# vim: ts=2 sw=2 et:
