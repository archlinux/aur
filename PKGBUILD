# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Jesus Franco <jesusfranco at gmail dot com>

_pkgname='trimdown'
pkgname="${_pkgname}-git"
pkgver=r67.81b3a3b
pkgrel=1
pkgdesc='Simple, feature rich, writing app for writing Novels, Short stories, Scripts and Articles'
arch=('x86_64')
url='https://github.com/artemanufrij/trimdown'
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
