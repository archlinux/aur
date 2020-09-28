# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='dippi'
pkgname="${_pkgname}-git"
pkgver=2.7.4.r3.gce76268
pkgrel=1
pkgdesc='Calculate display info like DPI and aspect ratio'
arch=('x86_64')
url='https://github.com/cassidyjames/dippi'
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
