# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='contrast'
pkgname="${_pkgname}-git"
pkgver=0.0.3.r55.gb90638b
pkgrel=1
pkgdesc='Check whether the contrast between two colors meets the WCAG requirements'
arch=('x86_64')
url='https://gitlab.gnome.org/World/design/contrast'
license=('GPL3')
depends=('libhandy')
makedepends=('cmake' 'git' 'meson' 'rust')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
