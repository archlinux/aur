# Maintainer: Raphael Scholer <rascholer@gmail.com>
_pkgname=desktoggle
pkgname=${_pkgname}-git
pkgver=1.7.1.r15.g9aa9ddc
pkgrel=1
pkgdesc='Hide all windows and show the desktop.'
arch=('i686' 'x86_64')
url="https://github.com/rscholer/${_pkgname}"
license=('GPL3')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
makedepends=('git' 'meson' 'python-docutils')
depends=('libx11')
source=("git+${url}")
sha256sums=('SKIP')

build() {
  cd "${_pkgname}"

  arch-meson build
  ninja -C build
}

pkgver() {
  cd "${_pkgname}"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_pkgname}"

  DESTDIR="${pkgdir}" meson install -C build
}
# vim:set ts=2 sw=2 et:
