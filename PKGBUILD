# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python38-pyfakefs
pkgver=5.0.0
pkgrel=1
pkgdesc='pyfakefs implements a fake file system that mocks the Python 3.8 file system modules'
url=https://github.com/jmcgeheeiv/pyfakefs/
license=(APACHE)
arch=(any)
depends=(python38-pytest)
makedepends=(
  git
  python38-setuptools
)
checkdepends=(
  python38-tox
)
_tag=8c8470e6de962c1b56069ce4d56cc704f366a83d
source=(git+https://github.com/jmcgeheeiv/pyfakefs.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd pyfakefs

  git describe --tags | sed 's/^v//'
}

build() {
  cd  pyfakefs

  python3.8 setup.py build
}

check() {
  cd  pyfakefs

  tox -e py38
}

package() {
  cd pyfakefs

  python3.8 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim: ts=2 sw=2 et:
