# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='workspaces'
pkgname="${_pkgname}-git"
pkgver=3.1.0.r0.gd3d69be
pkgrel=1
pkgdesc='Configure and quickly launch all you need to work on a project'
arch=('x86_64')
url='https://github.com/DevAlien/workspaces'
license=('GPL3')
depends=('granite')
makedepends=('git' 'meson' 'vala')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
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
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${_pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
