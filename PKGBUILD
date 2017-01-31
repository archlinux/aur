# Maintainer: Donnie West <me@donniewest.com>

pkgname=python-qtermwidget-git
pkgver=0.7.1.r8.gda8f04d
pkgrel=1
pkgdesc="qtermwidget bindings for PyQt5"
arch=('any')
url="https://github.com/DonnieWest/qtermwidget"
license=('MIT')
makedepends=('git')
depends=('python' 'qtermwidget')
options=(!emptydirs)
source=(python-qtermwidget-git::git+https://github.com/DonnieWest/qtermwidget)
md5sums=(SKIP)

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}/pyqt"
  QT_SELECT=5 python3 config.py
  make
}

package() {
  cd "${pkgname}/pyqt"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
