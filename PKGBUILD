# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='envelope'
pkgname="${_pkgname}-git"
pkgver=0.0.4.r8.g0c0b212
pkgrel=1
pkgdesc='Personal budget manager'
arch=('x86_64')
url='https://github.com/cjfloss/envelope'
license=('GPL3')
depends=('granite' 'sqlite')
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
