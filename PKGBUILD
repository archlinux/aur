# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor : Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='translit'
pkgname="${_pkgname}-git"
pkgver=1.0.0.r10.g326e80e
pkgrel=2
pkgdesc='Simple method of encoding Cyrillic letters with Latin ones'
arch=('x86_64')
url='https://github.com/artemanufrij/translit'
license=('GPL3')
depends=('granite' 'gtkspell3')
makedepends=('git' 'meson' 'vala')
conflicts=("${_pkgname}")
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
