# Maintainer: Luke Horwell <code (at) horwell (dot) me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

_pkgname=polychromatic
pkgname=$_pkgname-git
pkgver=0.9.5.r11.g4564dfe
pkgrel=1
pkgdesc='RGB lighting management front-end application for OpenRazer'
arch=('any')
license=('GPL-3.0-or-later')
source=("git+https://github.com/polychromatic/polychromatic.git")
url='https://github.com/polychromatic/polychromatic'
depends=(
  libappindicator
  python
  python-colorama
  python-colour
  python-gobject
  python-openrazer
  python-pyqt6
  python-pyqt6-webengine
  python-requests
  python-setproctitle
  qt6-svg
)
makedepends=(
  meson
  ninja
  git
)
provides=('polychromatic')
conflicts=('polychromatic')
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
