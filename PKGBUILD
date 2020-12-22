# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_pkgname=polychromatic
pkgname=$_pkgname-git
pkgver=0.6.0.r1.g9b48ea8
pkgrel=1
pkgdesc='Open source RGB lighting management front-end application for OpenRazer'
arch=('any')
license=('GPL3')
source=("git+https://github.com/polychromatic/polychromatic.git")
url='https://github.com/polychromatic/polychromatic'
makedepends=('git' 'meson' 'sassc')
depends=('python' 'python-colorama' 'python-setproctitle' 'python-pyqt5' 'python-pyqtwebengine' 'qt5-svg' 'libappindicator-gtk3' 'imagemagick' 'hicolor-icon-theme')
optdepends=('python-openrazer')
provides=('polychromatic')
conflicts=('polychromatic')
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
