# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='graphui'
pkgname="${_pkgname}-git"
pkgver=1.1.1.r2.gb2e7cae
pkgrel=1
pkgdesc='Graph visualization based on graphviz with included text editor and preview area'
arch=('x86_64')
url='https://github.com/artemanufrij/graphui'
license=('GPL3')
depends=('granite' 'gtksourceview3')
makedepends=('git' 'meson' 'vala')
provides=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
