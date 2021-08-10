# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Maintainer: Luke Horwell <code (at) horwell (dot) me>

_pkgname=polychromatic
pkgname=$_pkgname-git
pkgver=0.7.0.r2.g441a87a
pkgrel=1
pkgdesc='RGB lighting management front-end application for OpenRazer'
arch=('any')
license=('GPL3')
source=("git+https://github.com/polychromatic/polychromatic.git")
url='https://github.com/polychromatic/polychromatic'
makedepends=('git' 'meson' 'ninja' 'sassc')
depends=('python' 'python-colorama' 'python-colour' 'python-setproctitle' 'python-requests' 'python-pyqt5' 'python-pyqt5-webengine' 'qt5-svg' 'libappindicator-gtk3' 'python-gobject')
optdepends=('python-openrazer')
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
