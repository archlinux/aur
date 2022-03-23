# Maintainer: nobodyinperson <nobodyinperson at posteo de>
pkgname=python-psyplot-gui-git
_pkgname="$pkgname"
_pkgname=${_pkgname#python-}
_pkgname=${_pkgname%-git}
pkgver=1.4.0.r0.g227d84e
pkgrel=1
pkgdesc="Graphical User Interface for the psyplot package "
arch=(any)
url="https://github.com/${_pkgname%-gui}/$_pkgname"
license=(LGPL3)
makedepends=(git python-build python-installer)
depends=(python-psyplot python-sphinx python-fasteners python-sphinx_rtd_theme python-qtconsole python-pyqt5)
provides=("python-${_pkgname}" "${_pkgname}")
conflicts=("${provides[@]}")
source=("$pkgname::git+$url")
sha256sums=(SKIP)

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() { 
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir/" dist/*.whl
}

# vim:set ts=2 sw=2 et:
