# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='yishu'
pkgname="${_pkgname}-git"
pkgver=1.2.5.r0.g4388104
pkgrel=1
pkgdesc='Bespoke and simple Todo.txt client'
arch=('x86_64')
url='https://github.com/lainsce/yishu'
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
