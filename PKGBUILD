# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='gcron'
pkgname="${_pkgname}-git"
pkgver=1.0.5.r5.g36b830c
pkgrel=1
pkgdesc='Manage and understand your cron configuration with ease'
arch=('x86_64')
url='https://github.com/padjis/gcron'
license=('GPL3')
depends=('granite')
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
