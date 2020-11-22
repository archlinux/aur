# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='simple-stocks'
pkgname="${_pkgname}-git"
pkgver=1.0.8.r2.g9b4be86
pkgrel=1
pkgdesc='Keep tabs on your favorite stocks'
arch=('x86_64')
url='https://github.com/brendanperry/stocks'
license=('GPL3')
depends=('granite')
makedepends=('git' 'meson' 'vala')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
