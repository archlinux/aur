# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='stocks'
pkgname="simple-${_pkgname}-git"
pkgver=1.0.8.r2.g9b4be86
pkgrel=1
pkgdesc='Keep tabs on your favorite stocks'
arch=('x86_64')
url='https://github.com/brendanperry/stocks'
license=('GPL3')
provides=("${pkgname%-*}")
depends=('granite')
makedepends=('git' 'meson' 'vala')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname%-*}" "${_pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
